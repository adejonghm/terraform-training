/*
Developed by adejonghm
----------

December 3, 2023
*/


resource "azurerm_resource_group" "terraform_tf_vm" {
  name     = "rg-vm-${var.environment}"
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_public_ip" "udemy_tf_pub_ip" {
  name                = "vm-public-ip-${var.environment}"
  location            = var.location
  allocation_method   = var.allocation_method
  resource_group_name = azurerm_resource_group.terraform_tf_vm.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "udemy_tf_net_interface" {
  name                = "vm-net-interface-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.terraform_tf_vm.name

  ip_configuration {
    name                          = "vm-public-ip-${var.environment}"
    subnet_id                     = module.network.vnet_subnets[0]
    public_ip_address_id          = azurerm_public_ip.udemy_tf_pub_ip.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.commong_tags
}

resource "azurerm_network_interface_security_group_association" "udemy_tf_nisga" {
  network_interface_id      = azurerm_network_interface.udemy_tf_net_interface.id
  network_security_group_id = azurerm_network_security_group.udemy_tf.id
}

resource "azurerm_linux_virtual_machine" "udemy_tf_vm" {
  name                = "UdemyVm-${var.environment}"
  size                = var.linux_vm_size
  location            = var.location
  admin_username      = var.linux_vm_user
  resource_group_name = azurerm_resource_group.terraform_tf_vm.name

  network_interface_ids = [
    azurerm_network_interface.udemy_tf_net_interface.id
  ]

  depends_on = [
    azurerm_network_interface_security_group_association.udemy_tf_nisga
  ]

  admin_ssh_key {
    username   = var.linux_vm_user
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = local.commong_tags
}
