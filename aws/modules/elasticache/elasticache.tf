resource "aws_elasticache_cluster" "elasticache_cluster" {
  cluster_id = var.cluster_id
  engine = var.engine
  node_type = var.node_type
  num_cache_nodes = var.num_cache_nodes
  engine_version = var.engine_version
  port = var.port
  subnet_group_name = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids = [aws_security_group.security_group.id]
  depends_on = [
    aws_elasticache_subnet_group.elasticache_subnet_group,
    aws_security_group.security_group
  ]

  lifecycle {
    ignore_changes = [
      cluster_id,
      subnet_group_name
    ]
  }
}
