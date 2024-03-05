/*
Developed by adejonghm
----------

March 5, 2024
*/

output "subnet-id" {
  value       = azurerm_subnet.subnet-local-module.id
  description = "The Subnet ID of the module's Virtual Network"
}

output "nsg-id" {
  value       = azurerm_network_security_group.nsg-local-module.id
  description = "The Network Sec. Group ID of the module's Virtual Network"
}
