/*
Developed by adejonghm
----------

July 31, 2025
*/

resource "azurerm_public_ip" "pip" {
  name                = "${var.vm_name}_pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = var.pip_allocation_method

  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}_nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.nic_private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.vm_user
  admin_password      = var.vm_pass

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = var.os_disk_cache
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  tags = var.tags
}
