/*
Developed by adejonghm
----------

March 4, 2024
*/

resource "azurerm_resource_group" "rg-vm-remote-mod" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_public_ip" "pubblic-ip-vm-remote-mod" {
  name                = var.public-ip-name
  location            = azurerm_resource_group.rg-vm-remote-mod.location
  allocation_method   = var.public-ip-allocation-method
  resource_group_name = azurerm_resource_group.rg-vm-remote-mod.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic-vm-remote-mod" {
  name                = var.net-interface-name
  location            = azurerm_resource_group.rg-vm-remote-mod.location
  resource_group_name = azurerm_resource_group.rg-vm-remote-mod.name

  ip_configuration {
    name                          = var.net-interface-name
    subnet_id                     = ""
    public_ip_address_id          = azurerm_public_ip.pubblic-ip-vm-remote-mod.id
    private_ip_address_allocation = var.private-ip-allocation-method
  }

  tags = local.commong_tags
}

resource "azurerm_linux_virtual_machine" "vm-remote-mod" {
  name                = var.vm-name
  size                = var.vm-size
  location            = azurerm_resource_group.rg-vm-remote-mod.location
  admin_username      = var.vm-username
  resource_group_name = azurerm_resource_group.rg-vm-remote-mod.name

  network_interface_ids = [
    azurerm_network_interface.nic-vm-remote-mod.id
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

  tags = local.commong_tags
}
