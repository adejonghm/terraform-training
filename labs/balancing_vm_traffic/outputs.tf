/*
Developed by adejonghm
----------

July 31, 2025

*/

output "vm_public_ip" {
  description = "Public IP address of the Linux virtual machine"
  value = {
    for name, pip in module.vm :
    name => pip.vm_ip
  }
}

