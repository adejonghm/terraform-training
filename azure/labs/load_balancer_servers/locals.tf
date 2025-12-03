/*
Developed by adejonghm
----------

August 6, 2025
*/


locals {
  vm_count     = length(var.vm_name)
  subnet_count = length(var.subnets)

  vm_to_subnet = zipmap(
    var.vm_name,
    keys(var.subnets)
  )
}
