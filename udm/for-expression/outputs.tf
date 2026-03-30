/*
Developed by adejonghm
----------

May 12, 2024
*/

output "storage_account_id" {
  value       = [for sa in azurerm_storage_account.sa-for-exp : sa.id]
  description = "IDs of the Storages Account created on Azure"
}

output "storage_account_primary_access_key" {
  value       = { for key, sa in azurerm_storage_account.sa-for-exp : key => sa.primary_access_key }
  sensitive   = true
  description = "Primary access key for Storages Account created on Azure"
}
