# Amazon ElastiCache

建立 Amazon ElastiCache.

## Usage

在 `main.tf` 中使用 aws elasticache 模組的 yaml 範例.

```yaml
# 建立rds, 預設使用 redis:5.0.6
module "elasticache" {
  source = "../modules/elasticache"
  cluster_id = local.env
  engine = "redis"
  engine_version = "5.0.6"
  node_type = "cache.t3.micro"
  num_cache_nodes = 1
  port = 6379
  subnet_ids = module.network.public_subnet_ids
  security_group_cidr_blocks = concat(local.office_ip, [module.network.vpc_cidr_block])
}
```

### Output

輸出有下列參數, 可提供其他 module 使用.

1. cache_nodes (string)
