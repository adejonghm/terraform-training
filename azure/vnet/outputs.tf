/*
Developed by adejonghm
----------

March 4, 2024
*/

output "nsg-id" {
  value       = azurerm_network_security_group.nsgvnet.id
  description = "ID of the NSG used in the virtual network"
}

output "subnets-id" {
  value = {
    for name, subnet in azurerm_subnet.subnets :
    name => subnet.id
  }
  description = "Subnet ID created in the Virtual Network"
}
