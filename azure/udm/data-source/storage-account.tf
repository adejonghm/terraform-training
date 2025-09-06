/*
Developed by adejonghm
----------

June 20, 2024
*/

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_storage_account" "storage" {
  name                     = var.st_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.st_tier
  account_replication_type = var.st_rep_type

  tags = local.commong_tags
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.container_type
}

data "azurerm_storage_account_blob_container_sas" "blob_token" {
  connection_string = azurerm_storage_account.storage.primary_connection_string
  container_name    = azurerm_storage_container.container.name
  https_only        = true

  start  = var.start_date
  expiry = var.expiry_date

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }
}
