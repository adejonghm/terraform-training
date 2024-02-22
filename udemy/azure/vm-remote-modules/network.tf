/*
Developed by adejonghm
----------

November 29, 2023
*/

resource "azurerm_network_security_group" "udemy_tf" {
  name                = "udemy-nsg-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.terraform_tf_vm.name

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
  subnet_id                 = module.network.vnet_subnets[0]
  network_security_group_id = azurerm_network_security_group.udemy_tf.id
}
