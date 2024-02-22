/*
Developed by adejonghm
----------

November 29, 2023
*/

output "subnet_id" {
  value       = azurerm_subnet.udemy_tf.id
  description = "Subnet ID created in the Udemy Course."
}

output "security_group_id" {
  value       = azurerm_network_security_group.udemy_tf.id
  description = "Network Security Group ID created in the Udemy Course"
}