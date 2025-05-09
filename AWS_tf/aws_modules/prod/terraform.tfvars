#aws_region = "us-east-1"
#aws_region = "us-east-1"

cidr_block   = "20.0.0.0/16"
rtcidr_block = "0.0.0.0/0"

privatesubnetcidr = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]
pubsubnetcidr     = ["20.0.11.0/24", "20.0.12.0/24", "20.0.13.0/24"]

env = "prod"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

ingress_in = ["22", "80", "8080", "443"]

#vpc_id = module.vpc-prod.vpc_id
