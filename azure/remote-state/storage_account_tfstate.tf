/*
Developed by adejonghm
----------

November 23, 2023
*/

resource "azurerm_resource_group" "rgtfstate" {
  name     = var.rg_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "sttfstate" {
  name                            = var.storage_account_name
  location                        = var.location
  account_tier                    = var.account_tier
  resource_group_name             = azurerm_resource_group.rgtfstate.name
  account_replication_type        = var.account_replication_type
  public_network_access_enabled   = var.network_access_enabled
  allow_nested_items_to_be_public = var.blobs_to_be_public
  is_hns_enabled                  = var.hierarchical_namespace
  blob_properties {
    versioning_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "container" {
  name               = var.storage_container_name
  storage_account_id = azurerm_storage_account.sttfstate.id

  depends_on = [
    azurerm_storage_account.sttfstate
  ]
}
