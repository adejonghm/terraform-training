/*
Developed by adejonghm
----------

March 4, 2024
*/

output "vnet_genpurpose_location" {
  description = "ID of the NSG used in the virtual network"
  value       = azurerm_virtual_network.vnet.location
}

output "vnet_genpurpose_rg" {
  description = "The resource group where the Virtual Network is hosted"
  value       = azurerm_virtual_network.vnet.resource_group_name
}

output "vnet_genpurpose_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_genpurpose_address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.vnet.address_space

}

output "subnet_genpurpose_id" {
  description = "Subnet ID created in the Virtual Network"
  value       = azurerm_subnet.subnet.id
  sensitive   = true
}

output "nsg_genpurpose_id" {
  description = "NSG ID created for the Virtual Network"
  value       = azurerm_network_security_group.nsg.id
  sensitive   = true
}
