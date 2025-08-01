/*
Developed by adejonghm
----------

July 31, 2025

*/

output "vm_ip" {
  value       = azurerm_windows_virtual_machine.vm.private_ip_address
  description = "Public IP address of the Virtual Machine"
}
