/*
  Made by Alejandro de Jongh

  Providing a VNet within an specific Resource Group
*/


resource "azurerm_resource_group" "tf-rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment = var.tag_environment
    Team        = var.tag_team
  }
}

resource "azurerm_virtual_network" "tf-vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.tf-rg.location
  resource_group_name = azurerm_resource_group.tf-rg.name
  tags = {
    Environment = var.tag_environment
  }
}