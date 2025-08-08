/*
Developed by adejonghm
----------

August 6, 2025
*/


locals {
  number_of_vms = 2
  subnet_ids    = data.terraform_remote_state.subnets.outputs.subnet_ids

  vms = {
    for idx in range(local.number_of_vms) :
    "${var.vm_name}${idx + 1}" => {
      index     = idx + 1
      subnet_id = local.subnet_ids[idx % length(local.subnet_ids)]
    }
  }
}
