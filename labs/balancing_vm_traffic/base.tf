/*
Developed by adejonghm
----------

July 9, 2025

NOTES:
- Copy html file into de VMs
- Create the Load Balancer module.

*/


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

# USING THE TAGS MODULE
module "finops" {
  source = "./modules/tags"

  # VARIABLES
  owner       = "adejonghm"
  managed_by  = "terraform"
  environment = "labs"

  # ADDICIONAL TAGS
  additional_tags = {
    project = "balancing_vm_traffic"
  }
}

resource "azurerm_resource_group" "rg" {
  location = data.terraform_remote_state.vnet.outputs.vnet_location
  name     = var.rg_name

  tags = module.finops.tags
}

module "vm" {
  source = "./modules/vm"

  for_each = local.vms

  ## NETWORK VARIABLES
  subnet_id = each.value.subnet_id

  ## VM VARIABLES
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vm_name        = each.key
  vm_user        = "lx_user01"
  ssh_public_key = file(var.ssh_key_path)

  ## OS VARIABLES
  os_publisher = "Canonical"
  os_offer     = "0001-com-ubuntu-server-jammy"
  os_sku       = "22_04-lts"
  os_version   = "latest"

  # CUSTOM DATA FOR INSTALL NGINX
  web_server_install = filebase64("./script/install_nginx.sh")

  # RESOURCE TAGS 
  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method     = ""
  # nic_ip_config_name        = ""
  # nic_private_ip_allocation = ""
  # vm_size                   = ""
  # os_disk_cache             = ""
  # os_disk_type              = ""
}
