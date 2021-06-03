locals {
  gateway_tags = var.tags
  internet_gateway_id = aws_internet_gateway.internet_gateway.id 
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
  nat_gateway_id = aws_nat_gateway.nat_gateway.id
  eip_public_ip = aws_eip.eip.public_ip
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = local.vpc_id
  tags = local.gateway_tags
}

resource "aws_eip" "eip" {
  vpc = true
  tags = local.gateway_tags
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id = local.public_subnet_ids[0]
  tags = local.gateway_tags
}

resource "aws_vpc_peering_connection" "vpc_peering_connection" {
  peer_vpc_id = local.vpc_id
  vpc_id = local.default_vpc_id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = local.gateway_tags
}