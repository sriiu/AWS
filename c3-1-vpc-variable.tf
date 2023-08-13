variable "vpc_name" {
  description = "VPC Created via Terraform"
  type        = string
  default     = "MyVPC_terra"
}

variable "cidr_block" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

/*variable "vpc_AZ" {
  description = "VPC availablity zone"
  type = list(string)
  default = ["us-east-1a","us-east-1b"]  
}
*/

variable "vpc_public_subnet" {
  description = "VPC public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_private_subnet" {
  description = "VPC private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_database_subnets" {
  description = "VPC private subnets"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}

variable "vpc_create_database_subnet_group" {
  description = "VPC database subnets"
  type        = bool
  default     = true

}

variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type        = bool
  default     = true
}

variable "vpc_enable_nat_gateway" {
  type    = bool
  default = true

}

variable "vpc_single_nat_gateway" {
  type    = bool
  default = true

}
