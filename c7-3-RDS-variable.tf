/*variable "eks_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to launch the EKS cluster in."
}

variable "rds_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs to launch the RDS instance in."
  default = aws_eks_cluster_vpc_id
}

variable "db_name" {
  description = "The name of the database to create."
  default     = "usermgmt"
}

variable "db_username" {
  description = "The username for the database."
  default     = "dbadmin"
}

variable "db_password" {
  description = "The password for the database."
  default     = "dbpassword11"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance."
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The amount of storage to allocate for the RDS instance."
  default     = 10
}

variable "db_engine" {
  description = "The database engine to use for the RDS instance."
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version of the database engine to use for the RDS instance."
  default     = "8.0.28"
}
*/