# Output variable definitions
output "vpc_id" {
  description = "vpc id"
  value = local.vpc_id
}

output "vpc_cidr_block" {
  description = "vpc cidr block"
  value = local.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "public subnet ids"
  value = local.public_subnet_ids
}

output "private_subnet_ids" {
  description = "private subnet"
  value = local.private_subnet_ids
}

output "eip_public_ip" {
  description = "eip public ip"
  value = local.eip_public_ip
}

output "finish" {
  description = "network create finish"
  value = aws_route_table_association.vpc_private_route_table_association[0].id
}
