/*
Developed by adejonghm
----------

November 29, 2023
*/

resource "azurerm_resource_group" "terraform_vpc" {
  name     = var.rg_name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_virtual_network" "udemy_tf" {
  name                = var.virtual_network_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.terraform_vpc.name

  tags = local.commong_tags
}

resource "azurerm_subnet" "udemy_tf" {
  name                 = var.subnet_name
  address_prefixes     = ["10.0.1.0/24"]
  resource_group_name  = azurerm_resource_group.terraform_vpc.name
  virtual_network_name = azurerm_virtual_network.udemy_tf.name
}

resource "azurerm_network_security_group" "udemy_tf" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.terraform_vpc.name

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

resource "azurerm_subnet_network_security_group_association" "udemy_tf" {
  subnet_id                 = azurerm_subnet.udemy_tf.id
  network_security_group_id = azurerm_network_security_group.udemy_tf.id
}
