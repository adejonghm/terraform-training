/*
Developed by adejonghm
----------

December 3, 2023
*/

variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "rg_name" {
  type        = string
  default     = "TerraformVmRG"
  description = "Resource Group name for a Linux Virtual Machine"
}

variable "public_ip_name" {
  type        = string
  default     = "terraform-vm-public-ip"
  description = ""
}

variable "allocation_method" {
  type        = string
  default     = "Dynamic"
  description = ""
}

variable "network_interface_name" {
  type        = string
  default     = "terraform-vm-net_interface"
  description = ""
}

variable "linux_vm_name" {
  type        = string
  default     = "udemyTfLinuxVM"
  description = ""
}

variable "linux_vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "value"
}

variable "linux_vm_user" {
  type        = string
  default     = "terraform"
  description = ""
}
