/*
Developed by adejonghm
----------

July 17, 2025
*/


locals {
  default_tags = {
    owner       = var.owner
    managed_by  = var.managed_by
    environment = var.environment
  }

  merged_tags = merge(local.default_tags, var.additional_tags)
}
