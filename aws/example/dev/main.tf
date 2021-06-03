# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}

locals {
  env = "dev"
  office_ip = ["1.34.123.100/32", "1.34.123.101/32"]
  allow_deploy_ip = ["1.34.123.200/32"]
  network_vpc_cidr_block = "10.0.0.0/16"
  availability_zone = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  rds_instance_class = "db.t2.small"
  rds_password = "password"
  elasticache_node_type = "cache.t3.small"
}

# 建立 aws networking
module "networking" {
  source = "../modules/networking"
  vpc_cidr_block = local.network_vpc_cidr_block
  availability_zone = local.availability_zone
  tags = {
    "Name" = local.env
  }
}

# 建立 eks
module "eks" {
  source = "../modules/eks"
  cluster_name = local.env
  cluster_version = "1.18"
  cluster_role_name = "AWSEKSClusterRole"
  cluster_public_access_cidrs = local.office_ip
  node_group_name = "dev_node_group"
  node_role_name = "AWSEKSNodeGroup"
  # 勿修改下面參數. Do not modify the following settings.
  cluster_subnet_ids = module.networking.public_subnet_ids
  node_subnet_ids = module.networking.private_subnet_ids
}

# 建立rds
module "rds" {
  source = "../modules/rds"
  name = local.env
  identifier = "database-${local.env}"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = local.rds_instance_class
  allocated_storage = 100
  username = "admin"
  password = local.rds_password
  publicly_accessible = false
  subnet_ids = module.networking.public_subnet_ids
  security_group_cidr_blocks = concat(local.office_ip, [module.networking.vpc_cidr_block])
}

# 建立elasticache
module "elasticache" {
  source = "../modules/elasticache"
  cluster_id = local.env
  engine = "redis"
  engine_version = "5.0.6"
  node_type = local.elasticache_node_type
  num_cache_nodes = 1
  port = 6379
  subnet_ids = module.networking.public_subnet_ids
  security_group_cidr_blocks = concat(local.office_ip, [module.networking.vpc_cidr_block])
}
