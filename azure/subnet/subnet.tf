/*
Developed by adejonghm
----------

Creating a Virtual Network with all resources.

Mar 1, 2024
*/

resource "azurerm_subnet" "subnets" {
  resource_group_name  = data.terraform_remote_state.vnet.outputs.vnet-rg
  virtual_network_name = data.terraform_remote_state.vnet.outputs.vnet-name

  for_each         = var.subnets
  name             = each.key
  address_prefixes = [each.value]
}
