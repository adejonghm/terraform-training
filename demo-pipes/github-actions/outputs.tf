/*
Developed by adejonghm
----------

September 18, 2024
*/

output "vm-public-ip" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "Public IP address of the Virtual Machine"
}
