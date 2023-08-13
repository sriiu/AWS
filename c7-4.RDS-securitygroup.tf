/*module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name                = "${local.name}-RDS_Sg"
  vpc_id = aws_eks_cluster.eks_cluster.id
  description = "Allow access for RDS Database on Port 3306"
  #security_group_id = aws_db_subnet_group.rds_subnet.id
   
  ingress_rules       = ["3306"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]
  tags         = local.common_tags

}
*/


/*resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = tolist(module.vpc.private_subnets)

  tags = {
    Name = "My DB subnet group"
  }
}*/