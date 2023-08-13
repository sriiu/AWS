output "cluster_id" {
  description = "The name/id of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_arn" {
  description = "Amazon resource Name (ARN) of the cluster"
  value       = aws_eks_cluster.eks_cluster.arn

}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_version" {
  description = "the k8 server version for the EKS Cluster"
  value       = aws_eks_cluster.eks_cluster.version

}

output "cluster_security_group_id" {
  description = "SG attached to the EKS cluster"
  value       = [aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id]

}
output "cluster_iam_role_name" {
  description = "IAM role ARN of the EKS Cluster"
  value       = aws_iam_role.eks_master_role.name

}

output "cluster_iam_role_arn" {
  description = "IAM role ARN of the EKS Cluster"
  value       = aws_iam_role.eks_master_role.arn

}

output "cluster_oidc_issuer_url" {
  description = "URL on the EKS cluster OIDC Issuer"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer

}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
  #aws_eks_cluster.eks_cluster.vpc_config[0].private_subnets
}

/*output "aws_eks_cluster_vpc_id" {
  value = aws_eks_cluster.eks_cluster.vpc.id
  
}*/

# EKS Node Group Outputs - Public
/*
output "node_group_Private_id" {
  description = "Private Node Group ID"
  value       = aws_eks_node_group.eks_ng_private.id
}

output "node_group_Private_arn" {
  description = "Private Node Group ARN"
  value       = aws_eks_node_group.eks_ng_private.arn
}

output "node_group_Private_status" {
  description = "Private Node Group status"
  value       = aws_eks_node_group.eks_ng_private.status
}

output "node_group_Private_version" {
  description = "Private Node Group Kubernetes Version"
  value       = aws_eks_node_group.eks_ng_private.version
}
*/