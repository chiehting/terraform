# Amazon Relational Database Service

建立 Amazon Relational Database Service.

## Usage

在 `main.tf` 中使用 aws rds 模組的 yaml 範例.

```yaml
# 建立rds, 預設使用 mysql:5.7
module "rds" {
  source = "../modules/rds"
  name = local.env
  username = "admin"
  password = "Diija1234"
  subnet_ids = module.network.public_subnet_ids
  security_group_cidr_blocks = concat(local.office_ip, [module.network.vpc_cidr_block])
  allocated_storage = 100
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.small"
  backup_retention_period = 5
  publicly_accessible = true
  port = 3306
}
```

### Output

輸出有下列參數, 可提供其他 module 使用.

1. rds_endpoint (string)
