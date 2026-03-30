/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][githubdemo][pipeline]

September 18, 2024
*/


##############
##  GLOBAL  ##
##############
variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure Region used in the Terraform training"
}

variable "env" {
  description = "Environment where all resources are allocated."
  type        = string
  default     = "githubdemo"
}

variable "project" {
  description = "Name of the project"
  type        = string
  default     = "pipeline"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key. This value is specified in the terraform.tfvars file."
}

###############
##  NETWORK  ##
###############
variable "vnet-address-space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Address space for the VNet used to create an all-in-one Virtual Machine"
}

variable "subnet-address-prefixes" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "Vnet's subnet address-prefix used to create an all-in-one Virtual Machine"
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

variable "public-ip-sku" {
  type        = string
  default     = "Basic"
  description = "The Public IP SKU used to create a Virtual Machine with Dynamic IP"
}

################################
##  VIRTUAL MACHINE SETTINGS  ##
################################
variable "vm-size" {
  type        = string
  default     = "Standard_B1s"
  description = "Type and size of the All-in-one Virtual Machine"
}

variable "vm-username" {
  type        = string
  default     = "tf_user"
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