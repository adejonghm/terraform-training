/*
Developed by adejonghm
----------

July 9, 2025
*/

output "vm_ip" {
  value       = azurerm_linux_virtual_machine.vmlx.public_ip_address
  description = "Public IP address of the Virtual Machine"
}
