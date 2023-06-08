# Terraform AWS VPC with Public and Private Subnets

This project creates an AWS Virtual Private Cloud (VPC) with public and private subnets. It also includes the setup of Internet and NAT gateways to enable connectivity from the public subnet to the Internet and from the private subnet to the Internet via a NAT gateway.

I use this network setup in my other projects:
- [ECS Setup](https://github.com/chris-piwinsky/ecs_project)
- [Aurora Postgres](https://github.com/chris-piwinsky/rds_work)

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed on your local machine.
- An AWS account.
- AWS access key and secret key with sufficient permissions to create resources.

## Topology

![topology](./Topology.png)

## Outputs

| Name                | Description       | Type   |
| ------------------- | ----------------- | ------ |
| vpc_id              | VPC ID            | string |
| vpc_cidr_block      | CIDR block of VPC | string |
| public_subnet_1_id  | subnet ID         | string |
| public_subnet_2_id  | subnet ID         | string |
| public_subnet_3_id  | subnet ID         | string |
| private_subnet_1_id | subnet ID         | string |
| private_subnet_2_id | subnet ID         | string |
| private_subnet_3_id | subnet ID         | string |

## Infrastructure Setup

- Clone the repository to your local machine.
- Navigate to the project directory.
- Create a `terraform.tfvars` adding your AWS_ACCESS_KEY, AWS_SECRET_KEY, and REGION.
- Run `terraform init` to download the necessary provider plugins.
- Run `terraform plan` to preview the changes that Terraform will make to your infrastructure.
- Run `terraform apply` to create the infrastructure on AWS.
- When you are finished using the infrastructure, run `terraform destroy` to delete all the resources that Terraform created.

## Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
