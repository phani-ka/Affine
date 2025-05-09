#aws_region = "us-east-1"

cidr_block = "10.0.0.0/16"
rtcidr_block = "0.0.0.0/0"

privatesubnetcidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
pubsubnetcidr = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

env = "dev"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

ingress_in = ["22", "80", "8080", "443"]
