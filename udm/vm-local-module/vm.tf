/*
Developed by adejonghm
----------

March 5, 2024
*/

resource "azurerm_resource_group" "rg-vm-local-mod" {
  name     = "${var.rg-name}${var.domain}"
  location = var.location

  tags = {}
}

resource "azurerm_public_ip" "pubblic-ip-vm-local-mod" {
  name                = "${var.public-ip-name}${var.domain}"
  location            = azurerm_resource_group.rg-vm-local-mod.location
  allocation_method   = var.public-ip-allocation-method
  resource_group_name = azurerm_resource_group.rg-vm-local-mod.name

  tags = {}
}

resource "azurerm_network_interface" "nic-vm-local-mod" {
  name                = "${var.net-interface-name}${var.domain}"
  location            = azurerm_resource_group.rg-vm-local-mod.location
  resource_group_name = azurerm_resource_group.rg-vm-local-mod.name

  ip_configuration {
    name                          = "${var.net-interface-name}${var.domain}"
    subnet_id                     = module.vnet-local-module.subnet-id
    public_ip_address_id          = azurerm_public_ip.pubblic-ip-vm-local-mod.id
    private_ip_address_allocation = var.private-ip-allocation-method
  }

  tags = {}
}

resource "azurerm_network_interface_security_group_association" "nic-with-nsg" {
  network_interface_id      = azurerm_network_interface.nic-vm-local-mod.id
  network_security_group_id = module.vnet-local-module.nsg-id
}

resource "azurerm_linux_virtual_machine" "vm-local-mod" {
  name                = "${var.vm-name}${var.domain}"
  size                = var.vm-size
  location            = azurerm_resource_group.rg-vm-local-mod.location
  admin_username      = var.vm-username
  resource_group_name = azurerm_resource_group.rg-vm-local-mod.name

  network_interface_ids = [
    azurerm_network_interface.nic-vm-local-mod.id
  ]

  admin_ssh_key {
    username   = var.vm-username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.vm-disk-cache
    storage_account_type = var.vm-disk-type
  }

  source_image_reference {
    sku       = var.vm-image-sku
    offer     = var.vm-image-offer
    publisher = var.vm-image-publisher
    version   = var.vm-image-version
  }

  # tags = local.commong_tags
}

