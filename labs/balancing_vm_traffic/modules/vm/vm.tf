/*
Developed by adejonghm
----------

July 9, 2025
*/


resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}.nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.nic_private_ip_allocation
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.rg_name
  size                = var.vm_size
  admin_username      = var.vm_user
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.vm_user
    public_key = var.ssh_public_key
  }

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

  custom_data = var.web_server_install

  tags = var.tags
}
