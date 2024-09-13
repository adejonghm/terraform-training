/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

June 20, 2024
*/

variable "location" {
  description = "Azure location that I'm using"
  type        = string
  default     = "East US 2"
}

variable "rg_name" {
  description = "Resource Group used in Data Source Lab"
  type        = string
  default     = "rgudmtfdatasourcelab"
}

variable "start_date" {
  description = "Start date of the SAS token for blob images"
  type        = string
  default     = "2024-06-20"
}

variable "expiry_date" {
  description = "Start date of the SAS token for blob images"
  type        = string
  default     = "2024-07-20"
}

# ---------- STORAGE ACCOUNT ----------
variable "st_name" {
  description = "The name of the Strage Account used in Data Source Lab"
  type        = string
  default     = "studmtfdataforimages"
}

variable "st_tier" {
  description = "Storage Account Tier used in Data Source Lab"
  type        = string
  default     = "Standard"
}

variable "st_rep_type" {
  description = "The replication type for the Storage Account"
  type        = string
  default     = "LRS"
}

# ---------- CONTAINER BLOB ----------
variable "container_name" {
  description = "The Blob container created "
  type        = string
  default     = "blobimages"
}

variable "container_type" {
  description = "The container type used for the Storage Account in Data Source Lab"
  type        = string
  default     = "blob"
}
