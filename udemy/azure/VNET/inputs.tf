/*
Developed by adejonghm
----------

November 29, 2023
*/

variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure location that I'm using"
}

variable "rg_name" {
  type        = string
  default     = "TerraformVpcRG"
  description = "Resource Group name for Remote State"
}