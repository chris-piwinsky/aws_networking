# allow data flow between the components
resource "aws_security_group" "db" {
  vpc_id = data.aws_vpc.rds_vpc.id
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "${data.aws_vpc.rds_vpc.cidr_block}"
    ]
  }

  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"
    cidr_blocks = [
      "${data.aws_subnet.public_subnet_1.cidr_block}",
      "${data.aws_subnet.public_subnet_2.cidr_block}",
      "${data.aws_subnet.private_subnet_1.cidr_block}",
      "${data.aws_subnet.private_subnet_2.cidr_block}"
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "rds-security-group"
  }
}

output "sg_id" {
  value = aws_security_group.db.id
}
