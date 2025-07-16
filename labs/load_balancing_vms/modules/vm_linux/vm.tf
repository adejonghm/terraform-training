/*
Developed by adejonghm
----------

July 9, 2025
*/

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = var.pip_allocation_mode

  ### Add tags
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.vmlx_name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = data.terraform_remote_state.subnets.outputs.subnets-id[0]
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = var.private_ip_allocation_mode
  }

  ### Add tags
}

resource "azurerm_linux_virtual_machine" "vmlx" {
  name                = var.vmlx_name
  location            = var.location
  resource_group_name = var.rg_name
  size                = var.vmlx_size
  admin_username      = var.vmlx_user
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.vmlx_user
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vmlx_os_disk_type
  }

  source_image_reference {
    publisher = "Canonical"
    version   = "latest"
    offer     = var.vmlx_os_offer
    sku       = var.vmlx_os_sku
  }

  ### Add tags 
}
