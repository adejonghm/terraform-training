/*
Developed by adejonghm
----------

November 23, 2023
*/

resource "azurerm_resource_group" "rg-tfstate" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_storage_account" "sa-ud-tfstates" {
  depends_on = [
    azurerm_resource_group.rg-tfstate
  ]

  name                     = var.storage-account-name
  location                 = var.location
  account_tier             = var.account-tier
  resource_group_name      = azurerm_resource_group.rg-tfstate.name
  account_replication_type = var.account-replication-type

  # public_network_access_enabled = false
  # shared_access_key_enabled = false

  blob_properties {
    versioning_enabled = true
  }

  tags = local.commong_tags
}

resource "azurerm_storage_container" "container-tfstate" {
  name                 = var.storage-acc-container-name
  storage_account_name = azurerm_storage_account.sa-ud-tfstates.name

  depends_on = [azurerm_storage_account.sa-ud-tfstates]
}
