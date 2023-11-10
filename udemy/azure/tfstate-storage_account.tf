/*
Developed by adejonghm
----------

November 10, 2023
*/

resource "azurerm_resource_group" "terraform-rs-group" {
  name     = "terraform-rs-group"
  location = var.location

  tags = local.commong_tags
}


resource "azurerm_storage_account" "az_storage-tfstate-files" {
  name                     = "ud30183408-state-files"
  resource_group_name      = azurerm_resource_group.terraform-rs-group.name
  location                 = azurerm_resource_group.terraform-rs-group.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  depends_on               = [azurerm_resource_group.terraform-rs-group]

  tags = local.commong_tags
}

resource "azurerm_storage_container" "tfstate-files" {
  name                 = "tfstate-files"
  storage_account_name = azurerm_storage_account.az_storage-tfstate-files.name
  depends_on           = [azurerm_storage_account.az_storage-tfstate-files]
}