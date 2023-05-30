
resource "aws_iam_instance_profile" "bastion" {
  name = "rds-bastion-host-instance-profile"
  role = aws_iam_role.admin_access.name
}

resource "aws_instance" "bastion" {
  ami                    = "ami-0bef6cc322bfff646"
  instance_type          = "t3.medium"
  iam_instance_profile   = aws_iam_instance_profile.bastion.name
  subnet_id              = var.public_subnet_1
  vpc_security_group_ids = [aws_security_group.bastion_host.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo su -
    yum install git -y
  EOF

  tags = {
    Name = "rds-bastion-instance"
  }
}

# terraform aws security group to allow workstation pgadmin access