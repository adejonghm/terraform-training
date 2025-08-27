/*
Developed by adejonghm
----------

January 27, 2025
*/

output "load_balancer_id" {
  description = "ID of the load balancer"
  value       = azurerm_lb.public_lb.id
}

output "load_balancer_frontend_ip" {
  description = "Frontend IP address of the load balancer"
  value       = azurerm_public_ip.pip.ip_address
}

output "backend_address_pool_id" {
  description = "ID of the backend address pool"
  value       = azurerm_lb_backend_address_pool.bpool.id
}
