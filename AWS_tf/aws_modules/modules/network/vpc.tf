resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block
    enable_dns_hostnames = true
    tags = {
        Name = "${var.env}-terraform-vpc"
    }
}

resource "aws_internet_gateway" "igw-terraform" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.env}-igw-terraform"
    }
}

resource "aws_subnet" "subnet-public" {
    count   = length(var.pubsubnetcidr)
    vpc_id  = aws_vpc.vpc.id
    cidr_block = element(var.pubsubnetcidr, count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
        Name = "${var.env}-sub-${count.index + 1}-pub"
    }
  
}

resource "aws_subnet" "subnet-private" {
    count   = length(var.privatesubnetcidr)
    vpc_id  = aws_vpc.vpc.id
    cidr_block = element(var.privatesubnetcidr, count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
        Name = "${var.env}-sub-${count.index + 1}-private"
    }
  
}

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = var.rtcidr_block
        gateway_id = aws_internet_gateway.igw-terraform.id
    }
    tags = {
        name = "${var.env}-pub-rt-terraform"
    }
  
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.vpc.id
    #route {
    #    cidr_block = var.rtcidr_block
    #    
    #}
    tags = {
        name = "${var.env}-private-rt-terraform"
    }
  
}



resource "aws_route_table_association" "rt-t-ass" {
    count    = length(var.pubsubnetcidr)
    subnet_id = element(aws_subnet.subnet-public.*.id, count.index)
    route_table_id = aws_route_table.pub-rt.id
  
}