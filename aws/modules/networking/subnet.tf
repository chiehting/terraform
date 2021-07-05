locals {
  cidrsubnet_newbits = 4
  default_subnet = flatten([
    for subnet in aws_default_subnet.default_subnet : [
      subnet.id
    ]
  ])
  public_subnet_ids = flatten([
    for subnet in aws_subnet.public_subnet :
      subnet.id
  ])
  private_subnet_ids = flatten([
    for subnet in aws_subnet.private_subnet :
      subnet.id
  ])
  subnet_tags = merge(var.tags, {"kubernetes.io/cluster/${var.tags.Name}" = "shared"})
}

resource "aws_default_subnet" "default_subnet" {
  count = length(var.availability_zone)
  availability_zone = var.availability_zone[count.index]
  map_public_ip_on_launch = true
  tags = var.default_tags

  lifecycle {
    ignore_changes = [availability_zone]
  }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.availability_zone)
  vpc_id = local.vpc_id
  cidr_block = cidrsubnet(local.vpc_cidr_block, local.cidrsubnet_newbits, count.index)
  availability_zone = var.availability_zone[count.index % length(var.availability_zone)]
  map_public_ip_on_launch = true
  tags = merge(local.subnet_tags, {Name="${var.tags.Name}-public"})

  lifecycle {
    ignore_changes = [availability_zone]
  }
}

resource "aws_subnet" "private_subnet" {
  count = length(var.availability_zone)
  vpc_id = local.vpc_id
  cidr_block = cidrsubnet(local.vpc_cidr_block, local.cidrsubnet_newbits, count.index + length(var.availability_zone))
  availability_zone = var.availability_zone[count.index % length(var.availability_zone)]
  tags = merge(local.subnet_tags, {Name="${var.tags.Name}-private"})

  lifecycle {
    ignore_changes = [availability_zone]
  }
}
