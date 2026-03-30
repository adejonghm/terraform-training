/*
Developed by adejonghm
----------

March 4, 2024
*/

resource "azurerm_resource_group" "rg-vm-custom-data" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_public_ip" "public-ip-custom-data" {
  name                = var.public-ip-name
  location            = var.location
  allocation_method   = var.public-ip-allocation-method
  resource_group_name = azurerm_resource_group.rg-vm-custom-data.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic-custom-data" {
  name                = var.net-interface-name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-vm-custom-data.name

  ip_configuration {
    name                          = var.net-interface-name
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet-id[0]
    public_ip_address_id          = azurerm_public_ip.public-ip-custom-data.id
    private_ip_address_allocation = var.private-ip-allocation-method
  }

  tags = local.commong_tags
}

resource "azurerm_network_interface_security_group_association" "nic-with-nsg" {
  network_interface_id      = azurerm_network_interface.nic-custom-data.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.nsg-id
}

resource "azurerm_linux_virtual_machine" "vm-custom-data" {
  name                = var.vm-name
  size                = var.vm-size
  location            = var.location
  custom_data         = base64encode(file("./scripts/docker.sh"))
  admin_username      = var.vm-username
  resource_group_name = azurerm_resource_group.rg-vm-custom-data.name

  network_interface_ids = [
    azurerm_network_interface.nic-custom-data.id
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
    version   = var.vm-image-version
    publisher = var.vm-image-publisher
  }

  tags = local.commong_tags
}
