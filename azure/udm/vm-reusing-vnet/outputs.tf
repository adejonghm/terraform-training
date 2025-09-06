/*
Developed by adejonghm
----------

March 4, 2024
*/

output "public_ip" {
  description = ""
  value = format(
    "%s => %s",
    azurerm_linux_virtual_machine.reusing_vnet.name,
    azurerm_linux_virtual_machine.reusing_vnet.public_ip_address
  )
}
