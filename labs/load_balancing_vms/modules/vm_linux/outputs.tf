/*
Developed by adejonghm
----------

July 9, 2025
*/

output "vm_ip" {
  description = "Public IP address of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.vmlx.public_ip_address
}
