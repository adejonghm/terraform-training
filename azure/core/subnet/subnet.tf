/*
Developed by adejonghm
----------

Creating a Virtual Network with all resources.

Mar 1, 2024
*/


data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rgukwcstbaseresrcs"
    storage_account_name = "stukwcstterrfstate"
    container_name       = "tfstates"
    key                  = "core/vnet/terraform.tfstate"
  }
}

resource "azurerm_subnet" "subnets" {
  resource_group_name  = data.terraform_remote_state.vnet.outputs.vnet_genpurpose_rg
  virtual_network_name = data.terraform_remote_state.vnet.outputs.vnet_genpurpose_name

  for_each         = var.subnets
  name             = each.key
  address_prefixes = [each.value]
}

resource "azurerm_subnet_network_security_group_association" "nsg_snet" {
  network_security_group_id = data.terraform_remote_state.vnet.outputs.nsg_genpurpose_id

  for_each  = azurerm_subnet.subnets
  subnet_id = each.value.id
}

# resource "azurerm_network_security_group" "nsg" {
#   name                = var.nsg_name
#   location            = data.terraform_remote_state.vnet.outputs.vnet_location
#   resource_group_name = data.terraform_remote_state.vnet.outputs.vnet_rg

#   dynamic "security_rule" {
#     for_each = var.nsg_rules
#     content {
#       name                       = security_rule.value.name
#       priority                   = security_rule.value.priority
#       direction                  = security_rule.value.direction
#       access                     = security_rule.value.access
#       protocol                   = security_rule.value.protocol
#       source_port_range          = security_rule.value.source_port_range
#       destination_port_range     = security_rule.value.destination_port_range
#       source_address_prefix      = security_rule.value.source_address_prefix
#       destination_address_prefix = security_rule.value.destination_address_prefix
#     }
#   }
# }
