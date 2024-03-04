/*
Developed by adejonghm
----------

Feb 29, 2024
*/

variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure Region used in the Terraform training"
}

variable "rg-name" {
  type        = string
  default     = "RgUdVmAllInOne"
  description = "Resource group used to create an all-in-one Virtual Machine"
}

variable "nsg-name" {
  type        = string
  default     = "NsgUdVmAllInOne"
  description = "Network Sec. Group used to create an all-in-one Virtual Machine"
}

variable "vnet-name" {
  type        = string
  default     = "VnetUdVmAllInOne"
  description = "Virtual Network used to create an all-in-one Virtual Machine"
}

variable "vnet-address-space" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Address space for the VNet used to create an all-in-one Virtual Machine"
}

variable "subnet-name" {
  type        = string
  default     = "Subnet-A"
  description = "Subnet for the VNet used to create an all-in-one Virtual Machine"
}

variable "subnet-address-prefixes" {
  type        = string
  default     = "10.0.0.0/24"
  description = "Vnet's subnet address-prefix used to create an all-in-one Virtual Machine"
}

variable "net-interface-name" {
  type        = string
  default     = "NicUdVmAllInOne"
  description = "Network Interface used to create an all-in-one Virtual Machine"
}

variable "public-ip-name" {
  type        = string
  default     = "PiUdVmAllInOne"
  description = "Public IP for the all-in-one Virtual Machine"
}

variable "vm-name" {
  type        = string
  default     = "UdVmAllInOne"
  description = "Name of the All-in-One Virtual Machine"
}

variable "vm-size" {
  type        = string
  default     = "Standard_B1s"
  description = "Type and size of the All-in-one Virtual Machine"
}

variable "vm-username" {
  type        = string
  default     = "terraform"
  description = "Username user in the All-in-one Virtual Machine"
}

variable "vm-disk-type" {
  type        = string
  default     = "Standard_LRS"
  description = "Storage Account disk type used in the Virtual Machine"
}

variable "vm-disk-cache" {
  type        = string
  default     = "ReadWrite"
  description = "Disk cache type used in the Virtual Machine"
}

variable "vm-image-sku" {
  type        = string
  default     = "22_04-lts"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "vm-image-offer" {
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "vm-image-version" {
  type        = string
  default     = "latest"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "vm-image-publisher" {
  type        = string
  default     = "Canonical"
  description = "Sku image reference used to create a Virtual Machine"
}

variable "private-ip-allocation-method" {
  type        = string
  default     = "Dynamic"
  description = "The private IP allocation method used to create a Virtual Machine"
}

variable "public-ip-allocation-method" {
  type        = string
  default     = "Dynamic"
  description = "The public IP allocation method used to create a Virtual Machine"
}
