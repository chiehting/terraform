resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name = var.cluster_id
  subnet_ids = var.subnet_ids
}