locals {
  db_security_group_tags = {
    Name = "${var.name}-${var.engine}"
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_ids[0]
}

resource "aws_security_group" "security_group" {
  name = local.db_security_group_tags.Name
  description = "${var.name} ${var.engine} tls inbound"
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

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

  tags = local.db_security_group_tags

  lifecycle {
    ignore_changes = [
      name,
      description
    ]
  }
}
