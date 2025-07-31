/*
Developed by adejonghm
----------

July 9, 2025

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

# CREATING THE VM
module "vm_ubuntu" {
  source = "./modules/vm_linux"

  # NETWORK VARIABLES
  pip_name                   = "vmlx001-pip"
  ip_config_name             = "vmlx001_ip_configs"
  subnet_id                  = data.terraform_remote_state.subnets.outputs.subnets_id[0]
  private_ip_allocation_mode = "Dynamic"
  pip_allocation_mode        = "Static"

  # VM VARIABLES
  rg_name         = azurerm_resource_group.rg.name
  location        = azurerm_resource_group.rg.location
  ssh_public_key  = file("~/.ssh/id_rsa.pub")
  vm_name         = "vmlx001"
  vm_size         = "Standard_B1s"
  vm_user         = "lx-user01"
  vm_os_disk_type = "Standard_LRS"
  vm_os_sku       = "22_04-lts"
  vm_os_offer     = "0001-com-ubuntu-server-jammy"

  tags = module.finops.tags
}
