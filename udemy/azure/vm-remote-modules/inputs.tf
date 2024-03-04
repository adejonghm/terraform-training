/*
Developed by adejonghm
----------

December 3, 2023
*/

variable "location" {
  type = string
  # default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "allocation_method" {
  type = string
  # default     = "Dynamic"
  description = "Allocation method for the IP address of the Virtual Machine"
}

variable "linux_vm_size" {
  type = string
  # default     = "Standard_B1s"
  description = "Virtual Machine type and size"
}

variable "linux_vm_user" {
  type = string
  # default     = "terraform"
  description = "User created to access the Virtual Machine"
}

variable "nsg_name" {
  type = string
  # default     = "udemy-tf-nsg"
  description = "Network Security Group name of the Virtual Network."
}

variable "environment" {
  type = string
  # default     = "tf-env-remote-modules"
  description = "Variable from the network remote module"
}
