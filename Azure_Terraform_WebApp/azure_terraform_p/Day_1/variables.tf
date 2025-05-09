variable "storageaccountname" {}
variable "resourcegroupname" {}
variable "resourcegrouplocation" {}
variable "blobname" {}

locals {
  comman_tag = {
    env = "dev"
    
  }
}