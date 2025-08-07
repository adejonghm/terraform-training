/*
Developed by adejonghm
----------

July 31, 2025

*/

output "linuxvm_ip" {
  description = "Public IP address of the Linux virtual machine"
  value = {
    for name, pip in module.vm_ubuntu :
    name => pip.vm_ip
  }
}

# output "windowsvm_ip" {
#   description = "Public IP address of the Windows virtual machine"
#   value = {
#     for name, pip in module.vm_windows :
#     name => pip.vm_ip
#   }
# }
