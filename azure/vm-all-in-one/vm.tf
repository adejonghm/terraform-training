/*
Developed by adejonghm
----------

Creating a Virtual Machine with all resources.

Feb 29, 2024
*/

resource "azurerm_resource_group" "rg-vm" {
  name     = var.rg-name
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_virtual_network" "vnet-vm" {
  name                = var.vnet-name
  location            = azurerm_resource_group.rg-vm.location
  address_space       = var.vnet-address-space
  resource_group_name = azurerm_resource_group.rg-vm.name

  tags = local.commong_tags
}

resource "azurerm_subnet" "subnet-a" {
  name                 = var.subnet-name
  address_prefixes     = var.subnet-address-prefixes
  resource_group_name  = azurerm_resource_group.rg-vm.name
  virtual_network_name = azurerm_virtual_network.vnet-vm.name
}

resource "azurerm_network_security_group" "nsg-vm" {
  name                = var.nsg-name
  location            = azurerm_resource_group.rg-vm.location
  resource_group_name = azurerm_resource_group.rg-vm.name

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.commong_tags
}

resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                 = azurerm_subnet.subnet-a.id
  network_security_group_id = azurerm_network_security_group.nsg-vm.id
}

resource "azurerm_public_ip" "pubblic-ip-vm" {
  sku                 = var.public-ip-sku
  name                = var.public-ip-name
  location            = azurerm_resource_group.rg-vm.location
  allocation_method   = var.public-ip-allocation-method
  resource_group_name = azurerm_resource_group.rg-vm.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic-vm" {
  name                = var.net-interface-name
  location            = azurerm_resource_group.rg-vm.location
  resource_group_name = azurerm_resource_group.rg-vm.name

  ip_configuration {
    name                          = var.net-interface-name
    subnet_id                     = azurerm_subnet.subnet-a.id
    public_ip_address_id          = azurerm_public_ip.pubblic-ip-vm.id
    private_ip_address_allocation = var.private-ip-allocation-method
  }

  tags = local.commong_tags
}

resource "azurerm_linux_virtual_machine" "virtual-machine" {
  name                  = var.vm-name
  size                  = var.vm-size
  location              = azurerm_resource_group.rg-vm.location
  admin_username        = var.vm-username
  resource_group_name   = azurerm_resource_group.rg-vm.name
  network_interface_ids = [azurerm_network_interface.nic-vm.id]

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
