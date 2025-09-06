/*
Developed by adejonghm
----------

July 30, 2024
*/

output "vm-public-ip" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "This is the Public IP address used to access the Virtual Machine via SSH."
}
