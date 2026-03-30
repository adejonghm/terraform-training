/*
Developed by adejonghm
----------

November 23, 2023
*/

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "st" {
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  name                            = var.st_name
  account_tier                    = var.st_tier
  account_kind                    = var.st_kind
  account_replication_type        = var.st_replication_type
  allow_nested_items_to_be_public = var.blobs_to_be_public
  is_hns_enabled                  = var.hierarchical_namespace


  tags = local.common_tags
}

resource "azurerm_storage_container" "container" {
  storage_account_id    = azurerm_storage_account.st.id
  name                  = var.container_name
  container_access_type = "private"

  depends_on = [
    azurerm_storage_account.st
  ]
}
