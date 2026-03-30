/*
Developed by adejonghm
----------

July 30, 2024
*/

resource "azurerm_resource_group" "rg" {
  name     = "rg${var.env}${var.project}"
  location = "East US 2"

  tags = local.commong_tags
}

resource "azurerm_public_ip" "public-ip-vm" {
  name                = "pip${var.env}${var.project}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic" {
  name                = "nic${var.env}${var.project}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "pip${var.env}${var.project}"
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet-id[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip-vm.id
  }

  tags = local.commong_tags
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = data.terraform_remote_state.vnet.outputs.nsg-id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm${var.env}pipedemo"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = "terraform"

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "terraform"
    public_key = var.ssh_public_key
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
