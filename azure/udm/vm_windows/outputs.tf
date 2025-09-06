/*
Developed by adejonghm
----------

July 31, 2025

*/

output "vm_ip" {
  description = "Public IP address of the Virtual Machine"
  value       = azurerm_windows_virtual_machine.vm.public_ip_address
}
