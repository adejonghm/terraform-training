/*
Developed by adejonghm
----------

Feb 29, 2024
*/

output "vm-public-ip" {
  value       = azurerm_linux_virtual_machine.virtual-machine.public_ip_address
  description = "Public IP address of the Virtual Machine"
}
