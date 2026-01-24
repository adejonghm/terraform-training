/*
Developed by adejonghm
----------

January 24, 2026
*/

### IMPORTED MODULES ###
module "tags" {
  source = "github.com/adejonghm/terraform-modules/tags"

  owner       = var.owner
  managed_by  = var.management
  environment = var.environment

  # ADDITIONAL TAGS
  additional_tags = {
    project = "${var.project}"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "st" {
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  name                     = var.st_name
  account_tier             = var.st_tier
  account_kind             = var.st_kind
  account_replication_type = var.st_replication_type
}

resource "azurerm_storage_account_static_website" "fed" {
  storage_account_id = azurerm_storage_account.st.id
  error_404_document = var.error_file
  index_document     = var.index_file
}
