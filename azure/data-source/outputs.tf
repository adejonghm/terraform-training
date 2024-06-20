/*
Developed by adejonghm
----------

June 20, 2024
*/

output "sas_token" {
  description = "Token used to upload images in the Blob Storage Account"
  value       = data.azurerm_storage_account_blob_container_sas.blob_token.sas
  sensitive   = true
}

output "container_url" {
  description = "The container URL to upload images."
  value       = azurerm_storage_container.container.id
}
