variable "cidrblock" {}
variable "publicsubnetterra" {}
variable "privatesubnetterra" {}
variable "rtcidr_block" {}

variable "awsami" {}
variable "vmavailability_zone" {}
variable "instance_type" {}
variable "key_name" {}

variable "bucket" {}
variable "env" {}
variable "azs" {}

variable "ingress_in" {
  type = set(string)
}
#variable "egress_out" {}

variable "amis" {}

variable "aws_region" {}


