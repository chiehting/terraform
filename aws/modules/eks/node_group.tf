data "aws_iam_role" "node_role_arn" {
  name = var.node_role_name
}

resource "aws_eks_node_group" "node_group" {
  cluster_name = local.cluster_name
  node_group_name = var.node_group_name
  node_role_arn = data.aws_iam_role.node_role_arn.arn
  subnet_ids = var.node_subnet_ids

  scaling_config {
    desired_size = 2
    max_size = 2
    min_size = 2
  }

  lifecycle {
    ignore_changes = [
      scaling_config
    ]
  }
}
