/*
Developed by adejonghm
----------

March 4, 2024
*/

output "public-ip" {
  value = azurerm_linux_virtual_machine.vm-remote-mod.public_ip_address
}
