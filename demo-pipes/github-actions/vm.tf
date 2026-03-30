/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][githubdemo][pipeline]

September 18, 2024
*/

resource "azurerm_public_ip" "pip" {
  sku                 = var.public-ip-sku
  name                = "pi${var.env}${var.project}"
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.public-ip-allocation-method
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic" {
  name                = "nic${var.env}${var.project}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = azurerm_public_ip.pip.name
    subnet_id                     = azurerm_subnet.snet.id
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = var.private-ip-allocation-method
  }

  tags = local.commong_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm${var.env}${var.project}"
  size                = var.vm-size
  location            = azurerm_resource_group.rg.location
  admin_username      = var.vm-username
  resource_group_name = azurerm_resource_group.rg.name

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.vm-username
    public_key = var.ssh_public_key
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
