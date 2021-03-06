locals {
  db_subnet_group_tags = {
    Name = "${var.name}-db"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name = local.db_subnet_group_tags.Name
  description = "subnet group for ${var.name}"
  subnet_ids = var.subnet_ids
  tags = local.db_subnet_group_tags

  lifecycle {
    ignore_changes = [
      name,
      subnet_ids
    ]
  }
}
