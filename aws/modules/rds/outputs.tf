# Output variable definitions
output "rds_endpoint" {
  description = "rds_endpoint"
  value = aws_db_instance.db_instance.endpoint
}
