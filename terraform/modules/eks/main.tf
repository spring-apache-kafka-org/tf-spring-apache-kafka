resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.env}-${var.eks_name}"
  version  = var.eks_version
  role_arn = var.eks_role_arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids              = var.subnet_ids
  }

  tags = {
    Name       = "${var.env}-eks-cluster"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_eks_node_group" "ec2_node_group_general" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  version         = var.eks_version
  node_group_name = "general"
  node_role_arn   = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 10
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  tags = {
    Name       = "${var.env}-ec2-node-group-general"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}