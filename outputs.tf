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