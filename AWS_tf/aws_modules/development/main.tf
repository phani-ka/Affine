terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
  bucket = "mykphani7bucket2"
  key    = "statefile/dev.tfstate"
  region = "us-east-1"
  #dynamodb_table = "dynamodb-state-locking"
  }
}


provider "aws" {
  region = "us-east-1"

}


module "vpc" {
  source = "../modules/network"
  #aws_region = var.aws_region
  cidr_block   = var.cidr_block
  rtcidr_block = var.rtcidr_block
  privatesubnetcidr = var.privatesubnetcidr
  pubsubnetcidr  = var.pubsubnetcidr
  env  = var.env
  azs  = var.azs
  
}

module "sg" {
  source = "../modules/sg"
  ingress_in = var.ingress_in
  vpc_id     = module.vpc.vpc_id
  
}