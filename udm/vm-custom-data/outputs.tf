/*
Developed by adejonghm
----------

March 4, 2024
*/

output "publich-ip" {
  value       = azurerm_linux_virtual_machine.vm-custom-data.public_ip_address
  description = "Public IP address of the Virtual Machine"
}
