/*
Developed by adejonghm
----------

July 9, 2025

*/


### NOTES ###
# [ ] Create the subnets in the existing VNet
# [ ] Create the NSG for the subnets with the rules for load balancer
# [ ] Fix the Probe port in the Load Balancer
#############

# GET VNET
data "terraform_remote_state" "vnet" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rgtfsource"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "core/vnet/terraform.tfstate"
  }
}

# GET SUBNETS
data "terraform_remote_state" "subnets" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rgtfsource"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "core/subnet/terraform.tfstate"
  }
}

# IMPORT THE TAGS MODULE
module "finops" {
  source = "github.com/adejonghm/terraform-modules/tags"

  # VARIABLES
  owner       = var.owner
  managed_by  = var.management
  environment = var.environment

  # ADDICIONAL TAGS
  additional_tags = {
    project = "${var.project}"
  }
}

# CREATE VIRTUAL MACHINES
module "vm" {
  source = "./modules/vm"

  depends_on = [
    azurerm_resource_group.rg
  ]

  ## NETWORK VARIABLES
  subnet_id = each.value.subnet_id

  ## VM VARIABLES
  for_each = local.vms

  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vm_name        = each.key
  vm_user        = var.user
  ssh_public_key = file(var.ssh_key_path)

  ## OS VARIABLES
  os_publisher = var.os_publisher
  os_offer     = var.os_distro
  os_sku       = var.os_sku
  os_version   = var.os_version

  ## CUSTOM DATA FOR INSTALL NGINX
  web_server_install = filebase64(var.script_path)

  ## RESOURCE TAGS 
  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method     = ""
  # nic_private_ip_allocation = ""
  # vm_size                   = ""
  # os_disk_cache             = ""
  # os_disk_type              = ""
}

# CREATE LOAD BALANCER
module "load_balancer" {
  source = "./modules/load_balancer"

  depends_on = [
    azurerm_resource_group.rg
  ]

  ## LOAD BALANCER VARIABLES
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  lb_name  = var.lb_name
  lb_sku   = var.lb_sku

  ## RESOURCE TAGS 
  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method = ""
  # protocol              = ""
  # probe_port            = ""
  # fend_port             = ""
  # bend_port             = ""
}

# CREATE RESOURCE GROUP
resource "azurerm_resource_group" "rg" {
  location = data.terraform_remote_state.vnet.outputs.vnet_location
  name     = var.rg_name

  tags = module.finops.tags
}

# ASSOCIATE THE NETWORK INTERFACE TO THE BACKEND ADDRESS POOL
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
