# Create Three private subnets

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = element(data.aws_availability_zones.all.names, 0)

  tags = {
    Name = "project-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = element(data.aws_availability_zones.all.names, 1)

  tags = {
    Name = "project-private-subnet-2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.private_subnet_3_cidr
  availability_zone = element(data.aws_availability_zones.all.names, 2)

  tags = {
    Name = "project-private-subnet-3"
  }
}
