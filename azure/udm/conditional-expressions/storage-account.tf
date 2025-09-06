/*
Developed by adejonghm
----------

May 8, 2024
*/

resource "azurerm_resource_group" "rg-tfstate" {
  name     = "rg-${var.selector}-tftraining"
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_storage_account" "sa-ud-tfstates" {
  count = var.selector == "dev" ? 0 : 1

  depends_on = [azurerm_resource_group.rg-tfstate]

  name                     = "st${var.selector}condexpressions"
  location                 = var.location
  account_tier             = var.selector == "prd" ? "Premium" : "Standard"
  resource_group_name      = azurerm_resource_group.rg-tfstate.name
  account_replication_type = var.selector != "prd" ? "LRS" : "RAGZRS"

  tags = local.commong_tags
}
