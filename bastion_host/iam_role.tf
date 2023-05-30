resource "aws_iam_role" "admin_access" {
  name = "rds-bastion-host-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "rds-bastion-host-role"
  }
}

resource "aws_iam_policy_attachment" "admin_access_attachment" {
  name = "admin_access_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  roles = [
    aws_iam_role.admin_access.name
  ]
}