/*
Developed by adejonghm
----------

Create a storage account without Shared Key Access and SAS Token

December 11, 2024
*/

locals {
  commong_tags = {
    owner       = "adejonghm"
    managed-by  = "terraform"
    environment = "labs"
  }
}
