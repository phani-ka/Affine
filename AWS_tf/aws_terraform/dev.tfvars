cidrblock          = "10.0.0.0/16"
publicsubnetterra  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
privatesubnetterra = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
rtcidr_block       = "0.0.0.0/0"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]


awsami              = "ami-08b5b3a93ed654d19"
vmavailability_zone = "us-east-1a"
instance_type       = "t2.micro"
key_name            = "phani-aws"

bucket = "mykphani7bucket"
env    = "dev"

ingress_in = ["22", "80", "8080", "443"]
#egress_out = ["22", "80", "8080", "443"]
amis = {
  us-east-1 = "ami-08b5b3a93ed654d19"
  us-east-2 = "ami-084568db4383264d4"
}

aws_region = "us-east-1"
