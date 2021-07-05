locals {
  elasticache_security_group_tags = {
    Name = "${var.cluster_id}-${var.engine}"
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_ids[0]
}

resource "aws_security_group" "security_group" {
  name = local.elasticache_security_group_tags.Name
  description = "${var.cluster_id} ${var.engine} elasticache tls inbound"
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.security_group_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.elasticache_security_group_tags

  lifecycle {
    ignore_changes = [
      description,
      name
    ]
  }
}
