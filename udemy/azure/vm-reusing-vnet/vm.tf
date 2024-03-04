/*
Developed by adejonghm
----------

March 2, 2024
*/

resource "azurerm_resource_group" "rg-vm" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_public_ip" "public-ip-vm" {
  name                = var.public-ip-name
  location            = var.location
  allocation_method   = var.public-ip-allocation-method
  resource_group_name = azurerm_resource_group.rg-vm.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic-vm" {
  name                = var.net-interface-name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-vm.name

  ip_configuration {
    name                          = var.net-interface-name
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_id[0]
    public_ip_address_id          = azurerm_public_ip.public-ip-vm.id
    private_ip_address_allocation = var.private-ip-allocation-method
  }

  tags = local.commong_tags
}

resource "azurerm_network_interface_security_group_association" "nic-with-nsg" {
  network_interface_id      = azurerm_network_interface.nic-vm.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.nsg_id
}

resource "azurerm_linux_virtual_machine" "vm-resusing-vnet" {
  name                = var.vm-name
  size                = var.vm-size
  location            = var.location
  admin_username      = var.vm-username
  resource_group_name = azurerm_resource_group.rg-vm.name

  network_interface_ids = [
    azurerm_network_interface.nic-vm.id
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
    publisher = var.vm-image-publisher
    offer     = var.vm-image-offer
    sku       = var.vm-image-sku
    version   = var.vm-image-version
  }
}
