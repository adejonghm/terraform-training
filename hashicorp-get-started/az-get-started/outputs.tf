/*
  Made by Alejandro de Jongh

  Query data with outputs
*/

output "resource_group_id" {
  value = azurerm_resource_group.tf-rg.id
}

output "vnet_addresses" {
  value = azurerm_virtual_network.tf-vnet.address_space
}