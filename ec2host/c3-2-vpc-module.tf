# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {  
  #state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

# VPC Basic Details

name = "${local.name}-${var.vpc_name}"
cidr = var.cidr_block
azs = data.aws_availability_zones.available.names
public_subnets = var.vpc_public_subnet
private_subnets = var.vpc_private_subnet

database_subnets = var.vpc_database_subnets
create_database_subnet_group = var.vpc_create_database_subnet_group
create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

enable_nat_gateway = var.vpc_enable_nat_gateway
single_nat_gateway = var.vpc_single_nat_gateway

enable_dns_hostnames = false
enable_dns_support = false

tags = local.common_tags

public_subnet_tags = {
    type = "Public Subnets"
}

database_subnet_tags = {
    type = "Private Database subnets"
}

}