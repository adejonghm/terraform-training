/*
Developed by adejonghm
----------

July 9, 2025
*/


## GLOBAL
variable "subscription_id" {
  description = "ID of the Subscription that I use"
  type        = string
}

## NETWORK
variable "subnets" {
  description = "Map of subnet names to their address prefixes"
  type        = map(string)
  default = {
    snetservers001 = "10.88.20.0/24",
    snetservers002 = "10.88.30.0/24"
  }
}

variable "nsg_name" {
  description = "Name of the Network Security Group used to protect the servers behind the load balancer"
  type        = string
  default     = "nsg-lablbservers"
}

variable "nsg_rules" {
  description = ""
  type = list(
    object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })
  )
  default = [
    {
      name                       = "AllowHttpInBound"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

## FINOPS MODULE
variable "owner" {
  description = "Owner of the resources for tagging and cost allocation purposes"
  type        = string
  default     = "adejonghm"
}

variable "management" {
  description = "Management tool used to deploy and manage the infrastructure"
  type        = string
  default     = "terraform"
}

variable "environment" {
  description = "Environment where the resources will be deployed (e.g., dev, test, prod, labs)"
  type        = string
  default     = "labs"
}

variable "project" {
  description = "Project name for resource tagging and organization"
  type        = string
  default     = "lb_servers"
}

## RESOURCE GROUP
variable "rg_name" {
  description = "Name of the resource group where the resource will be deployed"
  type        = string
  default     = "rglbservers"
}

## VIRTUAL MACHINE MODULE
variable "number_of_instances" {
  description = "Number of virtual machine instances to create behind the load balancer"
  type        = number
  default     = 2
}
variable "vm_name" {
  description = "Prefix for the names of the virtual machines in the load balancer"
  type        = string
  default     = "vmlxserver"
}

variable "user" {
  description = "Administrator username for the Linux virtual machines"
  type        = string
  default     = "lx_user01"
}
variable "ssh_key_path" {
  description = "Path to the SSH public key file for authentication to the Linux virtual machines"
  type        = string
}

variable "os_publisher" {
  description = "Publisher of the OS image (e.g., Canonical for Ubuntu, RedHat, OpenLogic)"
  type        = string
  default     = "Canonical"
}

variable "os_distro" {
  description = "OS image offer name"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "os_sku" {
  description = "OS image SKU version (e.g., 22_04-lts)"
  type        = string
  default     = "22_04-lts"
}

variable "os_version" {
  description = "OS image version (e.g., latest, or specific version like 22.04.202006180)"
  type        = string
  default     = "latest"
}

variable "script_path" {
  description = "Path to the custom data script that will be executed during VM provisioning (e.g., nginx installation script)"
  type        = string
  default     = "./scripts/install_nginx.sh"
}

## LOAD BALANCER MODULE
variable "lb_name" {
  description = "Name of the Azure Load Balancer resource"
  type        = string
  default     = "lbextlxserverpool"
}

variable "lb_sku" {
  description = "SKU of the Azure Load Balancer (Basic or Standard)"
  type        = string
  default     = "Standard"
}

variable "backend_port" {
  description = "Port number for the health probe to check backend VM health"
  type        = number
  default     = 80
}
