resource "aws_vpc" "vpc-terraform" {
  cidr_block           = var.cidrblock
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_internet_gateway" "igw-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  tags = {
    Name = "igw-terraform"
  }
}

resource "aws_subnet" "subnet-public" {
  #count             = 3
  count             = length(var.publicsubnetterra)
  vpc_id            = aws_vpc.vpc-terraform.id
  cidr_block        = element(var.publicsubnetterra, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "subnet-${count.index + 1}-public"
  }
}

resource "aws_subnet" "subnet-private" {
  count             = length(var.privatesubnetterra)
  vpc_id            = aws_vpc.vpc-terraform.id
  cidr_block        = element(var.privatesubnetterra, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "subnet-${count.index + 1}-private"
  }
}


resource "aws_route_table" "pub-rt-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  route {
    cidr_block = var.rtcidr_block
    gateway_id = aws_internet_gateway.igw-terraform.id
  }
  tags = {
    Name = "pub-rt-terraform"
  }
}

resource "aws_route_table" "private-rt-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  # route {
  #   cidr_block = var.rtcidr_block
  #   #gateway_id = "local"
  #   #gateway_id = aws_internet_gateway.igw-terraform.id
  # }
  tags = {
    Name = "private-rt-terraform"
  }
}

resource "aws_route_table_association" "name" {
  count          = length(var.publicsubnetterra)
  subnet_id      = element(aws_subnet.subnet-public.*.id, count.index)
  route_table_id = aws_route_table.pub-rt-terraform.id

}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-terraform.id

  dynamic "ingress" {
    for_each = var.ingress_in
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "allow_all"
  }

}