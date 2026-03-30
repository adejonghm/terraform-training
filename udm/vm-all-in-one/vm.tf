/*
Developed by adejonghm
----------

Creating a Virtual Machine with all resources.

Feb 29, 2024
*/

resource "azurerm_resource_group" "rg-vm" {
  name     = var.rg_vm_all_in_one
  location = var.location

  tags = local.commong_tags
}

resource "azurerm_virtual_network" "vnet-vm" {
  name                = var.vnet_vm_all_in_one
  location            = azurerm_resource_group.rg-vm.location
  address_space       = var.vnet_address_space
  resource_group_name = azurerm_resource_group.rg-vm.name

  tags = local.commong_tags
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.subnet_vm_all_in_one
  address_prefixes     = var.subnet_address_prefixes
  resource_group_name  = azurerm_resource_group.rg-vm.name
  virtual_network_name = azurerm_virtual_network.vnet-vm.name
}

resource "azurerm_network_security_group" "nsg-vm" {
  name                = var.nsg_vm_all_in_one
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
  subnet_id                 = azurerm_subnet.subnet01.id
  network_security_group_id = azurerm_network_security_group.nsg-vm.id
}

resource "azurerm_public_ip" "pubblic-ip-vm" {
  sku                 = var.pip_sku
  name                = var.pip_vm_all_in_one
  location            = azurerm_resource_group.rg-vm.location
  allocation_method   = var.pip_allocation_method
  resource_group_name = azurerm_resource_group.rg-vm.name

  tags = local.commong_tags
}

resource "azurerm_network_interface" "nic-vm" {
  name                = var.nic_vm_all_in_one
  location            = azurerm_resource_group.rg-vm.location
  resource_group_name = azurerm_resource_group.rg-vm.name

  ip_configuration {
    name                          = var.nic_vm_all_in_one
    subnet_id                     = azurerm_subnet.subnet01.id
    public_ip_address_id          = azurerm_public_ip.pubblic-ip-vm.id
    private_ip_address_allocation = var.private_ip_allocation_method
  }

  tags = local.commong_tags
}

resource "azurerm_linux_virtual_machine" "virtual-machine" {
  name                  = var.vm_all_in_one
  size                  = var.vm_size
  location              = azurerm_resource_group.rg-vm.location
  admin_username        = var.vm_username
  resource_group_name   = azurerm_resource_group.rg-vm.name
  network_interface_ids = [azurerm_network_interface.nic-vm.id]

  admin_ssh_key {
    username   = var.vm_username
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = var.vm_disk_cache
    storage_account_type = var.vm_disk_type
  }
  source_image_reference {
    sku       = var.vm_image_sku
    offer     = var.vm_image_offer
    version   = var.vm_image_version
    publisher = var.vm_image_publisher
  }

  tags = local.commong_tags
}
