# Create an internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.production_vpc.id
  tags = {
    Name = "project-internet-gateway"
  }
}

# Add nat gateway to private route table

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}
