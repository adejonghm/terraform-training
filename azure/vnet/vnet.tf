/*
Developed by adejonghm
----------

Creating a Virtual Network with all resources.

Mar 1, 2024
*/

resource "azurerm_resource_group" "rg-vnet" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_network_security_group" "nsg-vnet" {
  name                = var.nsg-name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-vnet.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.commong_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  location            = var.location
  address_space       = [var.vnet-address-space]
  resource_group_name = azurerm_resource_group.rg-vnet.name

  subnet {
    name           = var.subnet-name
    security_group = azurerm_network_security_group.nsg-vnet.id
    address_prefix = var.subnet-address-prefixes
  }

  tags = local.commong_tags
}
