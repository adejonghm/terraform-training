/*
Developed by adejonghm
----------

July 9, 2025

NOTAS:
 - Study about NSG.

*/


module "vm-linux" {
  source = "./modules/vm_linux"

  # NETWORK VARIABLES
  pip_name                   = "vmlx001-pip"
  ip_config_name             = "vmlx001_ip_configs"
  private_ip_allocation_mode = "Dynamic"
  pip_allocation_mode        = "Static"

  # VM VARIABLES
  rg_name           = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  vmlx_name         = "vmlx001"
  vmlx_size         = "Standard_B1s"
  vmlx_user         = "lx-user01"
  vmlx_os_disk_type = "Standard_LRS"
  vmlx_os_sku       = "22_04-lts"
  vmlx_os_offer     = "0001-com-ubuntu-server-jammy"
}

module "finops" {
  source = "./modules/finops"

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
