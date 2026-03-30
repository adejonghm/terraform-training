/*
Developed by adejonghm
----------

March 4, 2024
*/

resource "azurerm_network_security_group" "nsg-vm-remote-mod" {
  name                = var.nsg-name
  location            = azurerm_resource_group.rg-vm-remote-mod.location
  resource_group_name = azurerm_resource_group.rg-vm-remote-mod.name

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
}

resource "azurerm_subnet_network_security_group_association" "subnet-with-nsg" {
  subnet_id                 = module.remote-network.vnet_subnets[0]
  network_security_group_id = azurerm_network_security_group.nsg-vm-remote-mod.id
}
