/*
Developed by adejonghm
----------

March 5, 2024
*/
output "public-ip" {
  value = azurerm_linux_virtual_machine.vm-local-mod.public_ip_address
}
