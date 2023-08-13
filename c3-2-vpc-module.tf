# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
  #state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  # VPC Basic Details

  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = tolist(var.vpc_public_subnet)
  private_subnets = tolist(var.vpc_private_subnet)

  database_subnets                   = var.vpc_database_subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
  # Additional Tags to Subnets

  public_subnet_tags = {
    type                                              = "Public Subnets"
    "kubernetes.io/role/internal-elb"                 = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }

  private_subnet_tags = {
    type                                              = "Private Subnets"
    "kubernetes.io/role/internal-elb"                 = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }


  database_subnet_tags = {
    type = "Private Database subnets"
  }

}