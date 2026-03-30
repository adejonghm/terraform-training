/*
Developed by adejonghm
----------

May 12, 2024
*/

output "storage_account_brazil_id" {
  value       = azurerm_storage_account.sa-for-each["br"].id
  description = "The Storage Account ID on Azure"
}

output "storage_account_europe_id" {
  value       = azurerm_storage_account.sa-for-each["eu"].id
  description = "The Storage Account ID on Azure"
}

output "storage_account_usa_id" {
  value       = azurerm_storage_account.sa-for-each["us"].id
  description = "The Storage Account ID on Azure"
}
