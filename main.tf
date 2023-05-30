# data lookup for all availability zones. 
data "aws_availability_zones" "all" {}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "rds-vpc"
  }
}


# Create two public subnets

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = element(data.aws_availability_zones.all.names, 0)
  map_public_ip_on_launch = true

  tags = {
    Name = "rds-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.20.0/24"
  availability_zone       = element(data.aws_availability_zones.all.names, 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "rds-public-subnet-2"
  }
}


# Create Two private subnets

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = element(data.aws_availability_zones.all.names, 0)

  tags = {
    Name = "rds-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.40.0/24"
  availability_zone = element(data.aws_availability_zones.all.names, 1)

  tags = {
    Name = "rds-private-subnet-2"
  }
}

# Create an internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "rds-internet-gateway"
  }
}

# Create an Elastic IP to associate with the NAT gateway

resource "aws_eip" "nat_gateway_eip" {
  vpc = true
  tags = {
    Name = "rds-eip"
  }
}

# Create a nat gateway

resource "aws_nat_gateway" "nat_gateway" {
  depends_on = [
    aws_internet_gateway.igw
  ]
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "rds-nat-gateway"
  }
}

# Create a public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rds-public-route-table"
  }
}

# Associate public subnets with public route table

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id
}


# Create a private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "rds-private-route-table"
  }
}

# Associate private subnets with private route table

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private.id
}


# module "rds_security_group" {
#   source             = "./security_group"
# }