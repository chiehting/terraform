locals {
  cluster_name = aws_eks_cluster.cluster.name
}

data "aws_iam_role" "cluster_role_arn" {
  name = var.cluster_role_name
}

resource "aws_eks_cluster" "cluster" {
  name = var.cluster_name
  role_arn = data.aws_iam_role.cluster_role_arn.arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = var.cluster_subnet_ids
    public_access_cidrs = var.cluster_public_access_cidrs
    endpoint_private_access = true
    endpoint_public_access = true
  }
}