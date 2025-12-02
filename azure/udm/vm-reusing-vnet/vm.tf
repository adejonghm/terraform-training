/*
Developed by adejonghm
----------

March 2, 2024
*/

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = data.terraform_remote_state.vnet.outputs.vnet_genpurpose_location

  tags = local.commong_tags
}

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.pip_allocation_method

  tags = local.commong_tags

  depends_on = [
    azurerm_resource_group.rg
  ]
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_name
    subnet_id                     = data.terraform_remote_state.vnet.outputs.subnet_genpurpose_id
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = var.private_ip_allocation_method
  }

  tags = local.commong_tags

  depends_on = [
    azurerm_resource_group.rg,
  ]
}

resource "azurerm_linux_virtual_machine" "reusing_vnet" {
  name                = var.vm_name
  size                = var.vm_size
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  admin_username      = var.vm_username

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
  admin_ssh_key {
    username   = var.vm_username
    public_key = file(var.ssh_key_path)
  }
  os_disk {
    caching              = var.vm_disk_cache
    storage_account_type = var.vm_disk_type
  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = local.commong_tags

  depends_on = [
    azurerm_network_interface.nic
  ]
}

# resource "azurerm_network_interface_security_group_association" "nsg_nic" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = data.terraform_remote_state.vnet.outputs.nsg_core_id
# }
