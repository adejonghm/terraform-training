/*
Developed by adejonghm
----------
November 23, 2023

*/

resource "azurerm_resource_group" "terraform_root" {
  name     = var.rg_name
  location = var.location

  tags = local.commong_tags
}


resource "azurerm_storage_account" "tfstates" {
  name                     = var.storage_account_name
  location                 = azurerm_resource_group.terraform_root.location
  account_tier             = var.account_tier
  resource_group_name      = azurerm_resource_group.terraform_root.name
  account_replication_type = var.account_replication_type

  depends_on = [azurerm_resource_group.terraform_root]

  blob_properties {
    versioning_enabled = true
  }

  tags = local.commong_tags
}

resource "azurerm_storage_container" "tfstate-container" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.tfstates.name

  depends_on = [azurerm_storage_account.tfstates]
}