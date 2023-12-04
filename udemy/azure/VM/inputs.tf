/*
Developed by adejonghm
----------

December 3, 2023
*/

variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure location that I'm using"
}

variable "rg_name" {
  type        = string
  default     = "TerraformVmRG"
  description = "Resource Group name for a Linux Virtual Machine"
}