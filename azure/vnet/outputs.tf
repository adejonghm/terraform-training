/*
Developed by adejonghm
----------

March 4, 2024
*/

output "vnet_location" {
  description = "ID of the NSG used in the virtual network"
  value       = azurerm_virtual_network.vnet.location
}

output "vnet_rg" {
  description = "The resource group where the Virtual Network is hosted"
  value       = azurerm_virtual_network.vnet.resource_group_name
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = ""
  value       = azurerm_virtual_network.vnet.address_space

}

# output "subnets_id" {
#   value = {
#     for name, subnet in azurerm_subnet.subnets :
#     name => subnet.id
#   }
#   description = "Subnet ID created in the Virtual Network"
# }
