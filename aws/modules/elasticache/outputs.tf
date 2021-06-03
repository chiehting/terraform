# Output variable definitions
output "cache_nodes" {
  description = "cache_nodes"
  value = aws_elasticache_cluster.elasticache_cluster.cache_nodes
}
