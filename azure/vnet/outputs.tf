/*
Developed by adejonghm
----------

March 4, 2024
*/

output "nsg-id" {
  value       = azurerm_network_security_group.nsg.id
  description = "ID of the NSG used in the virtual network"
}

output "subnets-id" {
  value = {
    for name, subnet in azurerm_subnet.subnets :
    name => subnet.id
  }
  description = "Subnet ID created in the Virtual Network"
}

output "vnet-name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network"
}

output "vnet-rg" {
  value       = azurerm_virtual_network.vnet.resource_group_name
  description = "The resource group where the Virtual Network is hosted"
}
