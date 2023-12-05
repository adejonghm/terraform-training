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
  description = "Public IP address of the virtual machine"
}

variable "allocation_method" {
  type        = string
  default     = "Dynamic"
  description = "Allocation method for the IP address of the Virtual Machine"
}

variable "network_interface_name" {
  type        = string
  default     = "terraform-vm-net_interface"
  description = "Network interface name used in the Virtual Machine"
}

variable "linux_vm_name" {
  type        = string
  default     = "udemyTfLinuxVM"
  description = "Name of the Virtual Machine used"
}

variable "linux_vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Virtual Machine type and size"
}

variable "linux_vm_user" {
  type        = string
  default     = "terraform"
  description = "User created to access the Virtual Machine"
}
