/*
Developed by adejonghm
----------

March 2, 2024
*/

resource "azurerm_resource_group" "rg-vm" {
  name     = var.rg_vm_without_vnet
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_public_ip" "public-ip-vm" {
  name                = var.pip_vm_without_vnet
  location            = var.location
  allocation_method   = var.pip_allocation_method
  resource_group_name = azurerm_resource_group.rg-vm.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic-vm" {
  name                = var.nic_vm_without_vnet
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-vm.name

  ip_configuration {
    name                          = var.nic_vm_without_vnet
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet-id[0]
    public_ip_address_id          = azurerm_public_ip.public-ip-vm.id
    private_ip_address_allocation = var.private_ip_allocation-method
  }

  tags = local.commong_tags
}

resource "azurerm_network_interface_security_group_association" "nic-with-nsg" {
  network_interface_id      = azurerm_network_interface.nic-vm.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.nsg-id
}

resource "azurerm_linux_virtual_machine" "vm-resusing-vnet" {
  name                = var.vm_without_vnet
  size                = var.vm_size
  location            = var.location
  admin_username      = var.vm_username
  resource_group_name = azurerm_resource_group.rg-vm.name

  network_interface_ids = [
    azurerm_network_interface.nic-vm.id
  ]
  admin_ssh_key {
    username   = var.vm_username
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = var.vm_disk_cache
    storage_account_type = var.vm_disk_type
  }
  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  tags = local.commong_tags
}
