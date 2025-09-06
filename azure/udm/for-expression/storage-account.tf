/*
Developed by adejonghm
----------

May 12, 2024
*/

resource "azurerm_resource_group" "rg-for-exp" {
  for_each = var.location

  name     = "rgudmtf${each.key}foreachlab"
  location = each.value

  tags = local.commong_tags
}

resource "azurerm_storage_account" "sa-for-exp" {
  for_each = azurerm_resource_group.rg-for-exp

  name                     = "studmtf${each.key}foreachlab"
  location                 = each.value.location
  account_tier             = var.account_tier
  resource_group_name      = each.value.name
  account_replication_type = var.account_replication_type

  tags = local.commong_tags
}

resource "azurerm_storage_container" "container-for-exp" {
  for_each = azurerm_storage_account.sa-for-exp

  name                 = "stblob${each.key}foreachlab"
  storage_account_name = each.value.name
}
