/*
Developed by adejonghm
----------

July 9, 2025
*/


data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rgterraform"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "udm-vnet/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnets" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rgterraform"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "udm-subnets/terraform.tfstate"
  }
}
