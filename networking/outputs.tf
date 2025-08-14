output "vpc_id" {
    value = aws_vpc.production_vpc.id
}

output "vpc_cidr_block" {
    value = aws_vpc.production_vpc.cidr_block
}

output "public_subnet_1_id" {
    value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
    value = aws_subnet.public_subnet_2.id
}

output "public_subnet_3_id" {
    value = aws_subnet.public_subnet_3.id
}

output "private_subnet_1_id" {
    value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
    value = aws_subnet.private_subnet_2.id
}

output "private_subnet_3_id" {
    value = aws_subnet.private_subnet_3.id
}

# Internet Gateway
output "internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}

# NAT Gateway
output "nat_gateway_id" {
    value = aws_nat_gateway.nat_gateway.id
}

output "nat_gateway_eip" {
    value = aws_eip.nat_gateway_eip.public_ip
}

# Route Tables
output "public_route_table_id" {
    value = aws_route_table.public.id
}

output "private_route_table_id" {
    value = aws_route_table.private.id
}

# VPC Endpoints Security Group
output "vpc_endpoints_security_group_id" {
    value = aws_security_group.vpc_endpoints.id
}

# VPC Endpoints
output "ecr_api_vpc_endpoint_id" {
    value = aws_vpc_endpoint.ecr_api.id
}

output "ecr_dkr_vpc_endpoint_id" {
    value = aws_vpc_endpoint.ecr_dkr.id
}

output "s3_vpc_endpoint_id" {
    value = aws_vpc_endpoint.s3.id
}

output "logs_vpc_endpoint_id" {
    value = aws_vpc_endpoint.logs.id
}

# VPC Endpoint DNS Names
output "ecr_api_vpc_endpoint_dns_names" {
    value = aws_vpc_endpoint.ecr_api.dns_entry[*].dns_name
}

output "ecr_dkr_vpc_endpoint_dns_names" {
    value = aws_vpc_endpoint.ecr_dkr.dns_entry[*].dns_name
}

output "logs_vpc_endpoint_dns_names" {
    value = aws_vpc_endpoint.logs.dns_entry[*].dns_name
}