/*
Developed by adejonghm
----------

Creating a Virtual Network with all resources.

Mar 1, 2024
*/

resource "azurerm_resource_group" "rgvnet" {
  name     = var.rg_name
  location = var.location

  tags = local.common_tags
}

resource "azurerm_network_security_group" "nsgvnet" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rgvnet.name

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

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  address_space       = [var.vnet_address_space]
  resource_group_name = azurerm_resource_group.rgvnet.name

  subnet {
    name             = var.subnet_name
    security_group   = azurerm_network_security_group.nsgvnet.id
    address_prefixes = var.subnet_address_prefixes
  }

  tags = local.common_tags
}
