locals {
    default_vpc_id = aws_default_vpc.default_vpc.id
    default_vpc_main_router_table_id = aws_default_vpc.default_vpc.main_route_table_id
    default_vpc_cidr_block = aws_default_vpc.default_vpc.cidr_block
    vpc_id = aws_vpc.vpc.id
    vpc_main_route_table_id = aws_vpc.vpc.main_route_table_id
    vpc_cidr_block = var.vpc_cidr_block
}

resource "aws_default_vpc" "default_vpc" {
  tags = var.default_tags
}

resource "aws_vpc" "vpc" {
  cidr_block = local.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = var.tags
}
