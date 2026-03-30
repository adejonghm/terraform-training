/*
Developed by adejonghm
----------

March 5, 2924
*/

resource "azurerm_network_security_group" "nsg-local-module" {
  name                = var.nsg-name
  location            = var.location
  resource_group_name = var.rg-name

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

  tags = {}
}

resource "azurerm_virtual_network" "vnet-local-module" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = var.rg-name

  address_space = [
    var.vnet-address-space
  ]

  tags = {}
}

resource "azurerm_subnet" "subnet-local-module" {
  name                 = var.subnet-name
  resource_group_name  = var.rg-name
  virtual_network_name = azurerm_virtual_network.vnet-local-module.name

  address_prefixes = [
    var.subnet-address-prefixes
  ]
}

resource "azurerm_subnet_network_security_group_association" "subnet-with-nsg" {
  subnet_id                 = azurerm_subnet.subnet-local-module.id
  network_security_group_id = azurerm_network_security_group.nsg-local-module.id
}
