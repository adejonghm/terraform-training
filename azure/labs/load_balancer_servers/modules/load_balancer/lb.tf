/*
Developed by adejonghm
----------

January 27, 2025
*/


resource "azurerm_lb" "lb" {
  sku                 = var.lb_sku
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.lb_rg

  frontend_ip_configuration {
    name                 = "fe-${var.lb_name}"
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "bpool" {
  name            = "bpool-${var.lb_name}"
  loadbalancer_id = azurerm_lb.lb.id

  depends_on = [
    azurerm_lb.lb
  ]
}

resource "azurerm_lb_probe" "vm_probe" {
  name            = "probe-${var.lb_name}"
  port            = var.probe_port
  protocol        = var.protocol
  loadbalancer_id = azurerm_lb.lb.id

  depends_on = [
    azurerm_lb.lb
  ]
}

resource "azurerm_lb_rule" "http" {
  name                           = "rule-${var.lb_name}"
  protocol                       = var.protocol
  frontend_port                  = var.fend_port
  backend_port                   = var.bend_port
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpool.id]
  probe_id                       = azurerm_lb_probe.vm_probe.id
  loadbalancer_id                = azurerm_lb.lb.id
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name

  depends_on = [
    azurerm_lb_probe.vm_probe
  ]
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.lb_name}.pip"
  location            = var.location
  resource_group_name = var.lb_rg
  allocation_method   = var.pip_allocation_method

  tags = var.tags
}
