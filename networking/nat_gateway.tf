# Create an Elastic IP to associate with the NAT gateway

resource "aws_eip" "nat_gateway_eip" {
  domain                    = "vpc"
  associate_with_private_ip = "10.0.0.5"

  tags = {
    Name = "project-eip"
  }
}

# Create a nat gateway

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet_3.id

  tags = {
    Name = "project-nat-gateway"
  }

  depends_on = [aws_eip.nat_gateway_eip]

}

# Add nat gateway to private route table

resource "aws_route" "nat_gw_route" {
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}
