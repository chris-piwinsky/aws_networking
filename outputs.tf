output "vpc_id" {
    value = module.networking.vpc_id
}

output "vpc_cidr_block" {
    value = module.networking.vpc_cidr_block
}

output "public_subnet_1_id" {
    value = module.networking.public_subnet_1_id
}

output "public_subnet_2_id" {
    value = module.networking.public_subnet_2_id
}

output "public_subnet_3_id" {
    value = module.networking.public_subnet_3_id
}

output "private_subnet_1_id" {
    value = module.networking.private_subnet_1_id
}

output "private_subnet_2_id" {
    value = module.networking.private_subnet_2_id
}

output "private_subnet_3_id" {
    value = module.networking.private_subnet_3_id
}

# Internet Gateway
output "internet_gateway_id" {
    value = module.networking.internet_gateway_id
    description = "ID of the Internet Gateway"
}

# NAT Gateway
output "nat_gateway_id" {
    value = module.networking.nat_gateway_id
    description = "ID of the NAT Gateway"
}

output "nat_gateway_eip" {
    value = module.networking.nat_gateway_eip
    description = "Elastic IP address of the NAT Gateway"
}

# Route Tables
output "public_route_table_id" {
    value = module.networking.public_route_table_id
    description = "ID of the public route table"
}

output "private_route_table_id" {
    value = module.networking.private_route_table_id
    description = "ID of the private route table"
}

# VPC Endpoints Security Group
output "vpc_endpoints_security_group_id" {
    value = module.networking.vpc_endpoints_security_group_id
    description = "Security Group ID for VPC endpoints"
}

# VPC Endpoints
output "ecr_api_vpc_endpoint_id" {
    value = module.networking.ecr_api_vpc_endpoint_id
    description = "ID of the ECR API VPC endpoint"
}

output "ecr_dkr_vpc_endpoint_id" {
    value = module.networking.ecr_dkr_vpc_endpoint_id
    description = "ID of the ECR DKR VPC endpoint"
}

output "s3_vpc_endpoint_id" {
    value = module.networking.s3_vpc_endpoint_id
    description = "ID of the S3 VPC endpoint"
}

output "logs_vpc_endpoint_id" {
    value = module.networking.logs_vpc_endpoint_id
    description = "ID of the CloudWatch Logs VPC endpoint"
}

# VPC Endpoint DNS Names
output "ecr_api_vpc_endpoint_dns_names" {
    value = module.networking.ecr_api_vpc_endpoint_dns_names
    description = "DNS names of the ECR API VPC endpoint"
}

output "ecr_dkr_vpc_endpoint_dns_names" {
    value = module.networking.ecr_dkr_vpc_endpoint_dns_names
    description = "DNS names of the ECR DKR VPC endpoint"
}

output "logs_vpc_endpoint_dns_names" {
    value = module.networking.logs_vpc_endpoint_dns_names
    description = "DNS names of the CloudWatch Logs VPC endpoint"
}