/*
Developed by adejonghm
----------

March 4, 2024
*/

output "subnets-id" {
  description = "Subnets ID created for the Virtual Network"
  sensitive   = true

  value = [
    for subnet in azurerm_subnet.subnets : subnet.id
  ]
}

output "subnets-name" {
  description = "Subnets Name created for the Virtual Network"

  value = [
    for subnet in azurerm_subnet.subnets : subnet.name
  ]
}
