/*resource "aws_db_subnet_group" "rds_subnet" {
  name = "eks-rds-db-subnetgroup"
  #vpc_id     = aws_eks_cluster.eks_cluster.vpc_id
  subnet_ids = aws_eks_cluster.eks_cluster.vpc_config[0].private_subnets
  depends_on = [
    aws_eks_cluster.eks_cluster.id
  ]
  
  tags = {
    Name = "My DB subnet group"
  }
}*/