output "vpc_id" {
  description = "VPC ID details"
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "cidr block details"
  value = module.vpc.vpc_cidr_block
}

output "Nat_Public_IP" {
  description = "public IP ID"
  value = module.vpc.nat_public_ips

}

output "private_subnets" {
  description = "list of ID for Private subnests"
  value = module.vpc.private_subnets  
}

output "public_subnets" {
  description  = "list of ID for Public Subnest " 
  value = module.vpc.public_subnets
}

output "azs" {
  value = module.vpc.azs
  
}