/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][githubdemo][pipeline]

September 18, 2024
*/


resource "azurerm_virtual_network" "vnet" {
  name                = "vnet${var.env}${var.project}"
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet-address-space
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.commong_tags
}

resource "azurerm_subnet" "snet" {
  name                 = "snet${var.env}${var.project}"
  address_prefixes     = var.subnet-address-prefixes
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg${var.env}${var.project}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 500
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

resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
