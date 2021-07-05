resource "aws_db_instance" "db_instance" {
  identifier = var.identifier
  name = var.name
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  engine = var.engine
  engine_version = var.engine_version
  port = var.port
  instance_class = var.instance_class
  username = var.username
  password = var.password
  backup_retention_period = var.backup_retention_period
  publicly_accessible = var.publicly_accessible
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  skip_final_snapshot = true
  auto_minor_version_upgrade = false
  depends_on = [
    aws_db_subnet_group.db_subnet_group,
    aws_security_group.security_group
  ]

  lifecycle {
    ignore_changes = [
      name,
      identifier,
      performance_insights_enabled,
      storage_encrypted
    ]
  }
}
