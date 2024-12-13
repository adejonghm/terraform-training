/*
Developed by adejonghm
----------

Create a storage account without Shared Key Access and SAS Token

December 11, 2024
*/

resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_storage_account" "st" {
  depends_on = [
    azurerm_resource_group.rg
  ]

  name                      = var.storage-account-name
  location                  = var.location
  account_tier              = var.account-tier
  resource_group_name       = azurerm_resource_group.rg.name
  account_replication_type  = var.account-replication-type
  shared_access_key_enabled = var.access-key-enabled
  # public_network_access_enabled = false

  blob_properties {
    versioning_enabled = true
  }

  tags = local.commong_tags
}

resource "azurerm_storage_container" "container" {
  name               = var.st-container-name
  storage_account_id = azurerm_storage_account.st.id
}
