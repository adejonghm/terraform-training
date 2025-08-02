/*
Developed by adejonghm
----------

July 31, 2025

*/

output "linuxvm_ip" {
  description = "Public IP address of the Linux virtual machine"
  value       = module.vm_ubuntu.vm_ip
}

output "windowsvm_ip" {
  description = "Public IP address of the Windows virtual machine"
  value       = module.vm_windows.vm_ip
}
