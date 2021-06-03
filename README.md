# Terraform

建立 Terraform 雲建置管理服務

## Getting Started

### AWS 範本

腳本範例可以參照 `aws/example` 底下的配置

### 匯入現有的rds範例

```
terraform import -state=example/dev/dev.tfstate -config=example/dev module.rds.aws_db_instance.db_instance database
```

## Run

### example

建置

```bash
terraform apply -state=example/dev/dev.tfstate example/dev
```

移除

```bash
terraform destroy -state=example/dev/dev.tfstate example/dev
```

### dreampay

建置

```bash
terraform apply -state=dreampay/global/global.tfstate dreampay/global
```

移除

```bash
terraform destroy -state=example/dev/dev.tfstate example/dev
```

### Prerequisites

1. Installed [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).


## License
[MIT](https://choosealicense.com/licenses/mit/)
