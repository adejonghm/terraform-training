/*
Developed by adejonghm
----------

December 3, 2023
*/


output "vm_ip" {
  value       = azurerm_linux_virtual_machine.udemy_tf_vm.public_ip_address
  description = "Public IP address of the Virtual Machine"
}