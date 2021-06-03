resource "aws_default_network_acl" "network_acl" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id
  subnet_ids = concat(local.public_subnet_ids, local.private_subnet_ids)
  ingress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  egress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  tags = var.tags
}
