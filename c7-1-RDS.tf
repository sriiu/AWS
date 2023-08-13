/*resource "aws_db_instance" "rds" {
  allocated_storage   = var.db_allocated_storage
  identifier = "usermgmt"
  db_name             = var.db_name
  engine              = var.db_engine
  port                 = "3306"
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
    #final_snapshot_identifier = terraform-*-snapshot
  db_subnet_group_name = module.vpc.database_subnet_group
  #vpc_security_group_ids = aws_eks_cluster.eks_cluster.security_group_id
  delete_automated_backups = true

}
*/




