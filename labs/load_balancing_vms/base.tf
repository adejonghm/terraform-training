/*
Developed by adejonghm
----------

July 9, 2025

NOTES:
- Create the Load Balancer module.
- Add two Linux VMs, one in each subnet. Use for_each or dynamic
*/


data "terraform_remote_state" "subnets" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rgterraform"
    storage_account_name = "stremotestatefiles"
    container_name       = "terraformstates"
    key                  = "labs/subnets/terraform.tfstate"
  }
}

locals {
  number_of_vms = 2
  os_type       = "lx"
  subnet_ids    = data.terraform_remote_state.subnets.outputs.subnet_ids

  vms = {
    for idx in range(local.number_of_vms) :
    "${var.vm_name_prefix}${local.os_type}${idx + 1}" => {
      index     = idx + 1
      subnet_id = local.subnet_ids[idx % length(local.subnet_ids)]
    }
  }
}

# USING THE TAGS MODULE
module "finops" {
  source = "./modules/tags"

  # VARIABLES
  owner       = "adejonghm"
  managed_by  = "terraform"
  environment = "sandbox"

  # ADDICIONAL TAGS
  additional_tags = {
    project = "load_balancing_vms"
  }
}

# CREATING RESOURCES
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = module.finops.tags
}

module "vm_ubuntu" {
  source = "./modules/vm_linux"

  for_each = local.vms

  ## NETWORK VARIABLES
  subnet_id = each.value.subnet_id

  ## VM VARIABLES
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vm_name        = each.key
  vm_user        = "lx-user01"
  ssh_public_key = file(var.key_path)

  ## OS VARIABLES
  os_publisher = "Canonical"
  os_offer     = "0001-com-ubuntu-server-jammy"
  os_sku       = "22_04-lts"
  os_version   = "latest"

  tags = module.finops.tags

  ## OPTIONAL VARIABLES
  # pip_allocation_method     = ""
  # nic_ip_config_name        = ""
  # nic_private_ip_allocation = ""
  # vm_size                   = ""
  # os_disk_cache             = ""
  # os_disk_type              = ""
}
