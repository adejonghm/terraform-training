/*
Developed by adejonghm
----------

March 4, 2024
*/

output "nsg_id" {
  value       = azurerm_network_security_group.nsg-vnet.id
  description = "ID of the NSG used in the virtual network"
}

output "subnet_id" {
  value       = azurerm_virtual_network.vnet.subnet.*.id
  description = "Subnet ID created in the Virtual Network"
}
