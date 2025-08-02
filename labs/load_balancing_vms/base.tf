/*
Developed by adejonghm
----------

July 9, 2025

NOTES:
- Create the Load Balancer module.
- Add two Linux VMs, one in each subnet. Use for_each or dynamic
*/


data "terraform_remote_state" "subnets" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rgterraform"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "labs/subnets/terraform.tfstate"
  }
}

# USING THE TAGS MODULE
module "finops" {
  source = "./modules/tags"

  # VARIABLES
  owner       = "adejonghm"
  managed_by  = "terraform"
  environment = "sandbox"

  # ADDICIONAL TAGS
  additional_tags = {
    project = "load_balancing_vms"
  }
}

# CREATING RESOURCES
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = module.finops.tags
}

module "vm_windows" {
  source = "./modules/vm_windows"

  ## NETWORK VARIABLES
  subnet_id = data.terraform_remote_state.subnets.outputs.subnets_id[0]

  ## VM VARIABLES
  location = azurerm_resource_group.rg.location
  rg_name  = azurerm_resource_group.rg.name
  vm_name  = "vmloadbalancerwn01"
  vm_user  = "wn-user01"
  vm_pass  = var.win_pass

  ## OS VARIABLES
  os_publisher = "MicrosoftWindowsServer"
  os_offer     = "WindowsServer"
  os_sku       = "2022-datacenter-g2"
  os_version   = "latest"

  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method     = ""
  # nic_ip_config_name        = ""
  # nic_private_ip_allocation = ""
  # vm_size                   = ""
  # os_disk_cache             = ""
  # os_disk_type              = ""
}

module "vm_ubuntu" {
  source = "./modules/vm_linux"

  ## NETWORK VARIABLES
  subnet_id = data.terraform_remote_state.subnets.outputs.subnets_id[1]

  ## VM VARIABLES
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vm_name        = "vmloadbalancerlx01"
  vm_user        = "lx-user01"
  ssh_public_key = var.public_key

  ## OS VARIABLES
  os_publisher = "Canonical"
  os_offer     = "0001-com-ubuntu-server-jammy"
  os_sku       = "22_04-lts"
  os_version   = "latest"

  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method     = ""
  # nic_ip_config_name        = ""
  # nic_private_ip_allocation = ""
  # vm_size                   = ""
  # os_disk_cache             = ""
  # os_disk_type              = ""
}
