/*
Developed by adejonghm
----------

July 31, 2025

*/


output "lb_frontend_ip" {
  description = "Public IP address of the Azure Load Balancer frontend"
  value       = module.load_balancer.frontend_ip
}
