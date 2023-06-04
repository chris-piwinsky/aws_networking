# Create Three public subnets

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.production_vpc.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = element(data.aws_availability_zones.all.names, 0)
  map_public_ip_on_launch = true

  tags = {
    Name = "project-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.production_vpc.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = element(data.aws_availability_zones.all.names, 1)
  map_public_ip_on_launch = true

  tags = {
    Name = "project-public-subnet-2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.production_vpc.id
  cidr_block              = var.public_subnet_3_cidr
  availability_zone       = element(data.aws_availability_zones.all.names, 2)
  map_public_ip_on_launch = true

  tags = {
    Name = "project-public-subnet-3"
  }
}
