/*
Developed by adejonghm
----------

July 9, 2025
*/


output "nic_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.nic.id
  sensitive   = true
}

output "ip_configuration_name" {
  description = "Name of the IP configuration for the network interface"
  value       = azurerm_network_interface.nic.ip_configuration
}
