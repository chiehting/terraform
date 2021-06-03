resource "aws_route" "default_route_table" {
  route_table_id = local.default_vpc_main_router_table_id
  destination_cidr_block = local.vpc_cidr_block
  vpc_peering_connection_id = local.vpc_peering_connection_id
}

resource "aws_default_route_table" "vpc_public_route_table" {
  default_route_table_id = local.vpc_main_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.internet_gateway_id
  }

  route {
    cidr_block = local.default_vpc_cidr_block
    vpc_peering_connection_id = local.vpc_peering_connection_id
  }

  tags = merge(var.tags, {Name="${var.tags.Name}-public"})
}

resource "aws_route_table" "vpc_private_route_table" {
  vpc_id = local.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = local.nat_gateway_id
  }

  route {
    cidr_block = local.default_vpc_cidr_block
    vpc_peering_connection_id = local.vpc_peering_connection_id
  }

  tags = merge(var.tags, {Name="${var.tags.Name}-private"})
}

resource "aws_route_table_association" "vpc_public_route_table_association" {
  count = length(local.public_subnet_ids)
  subnet_id = local.public_subnet_ids[count.index]
  route_table_id = local.vpc_main_route_table_id
}

resource "aws_route_table_association" "vpc_private_route_table_association" {
  count = length(local.private_subnet_ids)
  subnet_id = local.private_subnet_ids[count.index]
  route_table_id = aws_route_table.vpc_private_route_table.id
}

