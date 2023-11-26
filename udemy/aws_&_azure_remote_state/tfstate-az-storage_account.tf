/*
Developed by adejonghm
----------
November 23, 2023

*/

resource "azurerm_resource_group" "terraform" {
  name     = "terraform"
  location = var.az_location

  tags = local.commong_tags
}


resource "azurerm_storage_account" "tfstates" {
  name                     = var.global_name
  resource_group_name      = azurerm_resource_group.terraform.name
  location                 = azurerm_resource_group.terraform.location
  account_tier             = var.az_account_tier
  account_replication_type = var.az_account_replication_type
  depends_on               = [azurerm_resource_group.terraform]

  blob_properties {
    versioning_enabled = true
  }

  tags = local.commong_tags
}

resource "azurerm_storage_container" "tfstate-container" {
  name                 = "remote-state"
  storage_account_name = azurerm_storage_account.tfstates.name
  depends_on           = [azurerm_storage_account.tfstates]
}