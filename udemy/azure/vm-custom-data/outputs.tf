/*
Developed by adejonghm
----------

February 20, 2024
*/


output "vm_ip" {
  value       = azurerm_linux_virtual_machine.udemy_tf_vm.public_ip_address
  description = "Public IP address of the Virtual Machine"
}
