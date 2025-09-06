/*
Developed by adejonghm
----------

July 9, 2025

ToDo:
> [x] Create the subnets in the existing VNet
> [ ] Create the NSG for the subnets with the rules for load balancer
> [ ] Fix the Probe port in the Load Balancer
*/


### GETs & IMPORTs
data "terraform_remote_state" "vnet" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rgtfsource"
    storage_account_name = "stremotestatefiles"
    container_name       = "tfstates"
    key                  = "core/vnet/terraform.tfstate"
  }
}

module "finops" {
  source = "github.com/adejonghm/terraform-modules/tags"

  owner       = var.owner
  managed_by  = var.management
  environment = var.environment

  # ADDITIONAL TAGS
  additional_tags = {
    project = "${var.project}"
  }
}

### NETWORK
module "snet" {
  source = "github.com/adejonghm/terraform-modules/subnet"

  vnet_rg          = data.terraform_remote_state.vnet.outputs.vnet_rg
  vnet_name        = data.terraform_remote_state.vnet.outputs.vnet_name
  for_each         = var.subnets
  snet_name        = each.key
  address_prefixes = [each.value]
}

resource "azurerm_network_security_group" "nsg" {
  resource_group_name = data.terraform_remote_state.vnet.outputs.vnet_rg
  location            = data.terraform_remote_state.vnet.outputs.vnet_location
  name                = var.nsg_name

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_snet" {
  network_security_group_id = azurerm_network_security_group.nsg.id

  for_each  = module.snet
  subnet_id = each.value.subnet_id
}

### CREATE THE RESOURCES
resource "azurerm_resource_group" "rg" {
  location = data.terraform_remote_state.vnet.outputs.vnet_location
  name     = var.rg_name

  tags = module.finops.tags
}

module "vm" {
  source = "./modules/vm"

  depends_on = [
    azurerm_resource_group.rg
  ]

  ## NETWORK VARIABLES
  subnet_id = each.value.subnet_id

  ## VM VARIABLES
  for_each = local.vms

  location       = azurerm_resource_group.rg.location
  vm_rg          = azurerm_resource_group.rg.name
  vm_name        = each.key
  vm_user        = var.user
  ssh_public_key = file(var.ssh_key_path)

  ## OS VARIABLES
  os_publisher = var.os_publisher
  os_offer     = var.os_distro
  os_sku       = var.os_sku
  os_version   = var.os_version

  ## CUSTOM DATA TO INSTALL NGINX
  web_server_install = filebase64(var.script_path)

  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method     = ""
  # nic_private_ip_allocation = ""
  # vm_size                   = ""
  # os_disk_cache             = ""
  # os_disk_type              = ""
}

module "load_balancer" {
  source = "./modules/load_balancer"

  depends_on = [
    azurerm_resource_group.rg
  ]

  ## LOAD BALANCER VARIABLES
  location   = azurerm_resource_group.rg.location
  lb_rg      = azurerm_resource_group.rg.name
  lb_name    = var.lb_name
  lb_sku     = var.lb_sku
  probe_port = var.backend_port
  bend_port  = var.backend_port

  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method = ""
  # protocol              = ""
  # fend_port             = ""
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_bpool" {
  depends_on = [
    module.vm,
    module.load_balancer
  ]

  for_each = local.vm_nic_ids

  network_interface_id    = each.value
  backend_address_pool_id = module.load_balancer.backend_address_pool_id
  ip_configuration_name   = module.vm[each.key].ip_configuration_name[0].name
}
