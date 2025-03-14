output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_iam_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.ec2_iam_role.arn
}