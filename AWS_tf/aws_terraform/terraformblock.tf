terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #backend "s3" {
  #bucket = "mykphani7bucket2"
  #key    = "statefile/dev.tfstate"
  #region = "us-east-1"
  #dynamodb_table = "dynamodb-state-locking"
  #}
}


provider "aws" {
  region = "us-east-1"

}