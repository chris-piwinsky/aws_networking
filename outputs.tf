output "vpc_settings" {
  value = aws_vpc.main
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet_1
}

output "private_subnet_1" {
  value = aws_subnet.private_subnet_1
}

output "private_subnet_2" {
  value = aws_subnet.private_subnet_2
}