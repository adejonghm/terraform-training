/*
Developed by adejonghm
----------

August 6, 2025
*/


locals {
  ## CREATING A VM IN EACH SUBNET
  number_of_vms = var.number_of_instances
  subnet_ids    = [for snet in module.snet : snet.subnet_id]

  vms = {
    for idx in range(local.number_of_vms) :
    "${var.vm_name}${idx + 1}" => {
      index     = idx + 1
      subnet_id = local.subnet_ids[idx % length(local.subnet_ids)]
    }
  }

  ## GET THE NETWORK INTERFACE IDs
  vm_nic_ids = {
    for vm_name, vm in module.vm :
    vm_name => vm.nic_id
  }
}
