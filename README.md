# Terraform

建立 Terraform 雲建置管理服務

## Getting Started

### Prerequisites

1. Installed [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Run

### 架構

目錄結構如下

* 第一層使用 `cloud providers` 做分類，例如 aws。
* 第二層
  * 模組目錄 `modules`，雲端元件模組化，例如 iam、networking。
  * 使用 `cloud account 別名` 做分類，例如 bitwin、unicat、dreampay、sparkSport。
* 第三層使用 `環境名稱` 做分類，例如 global、dev、stage、uat、prod。

```bash
$ [14:19:33] terraform on  master [✘»!+] at ☸️  unicat/stage (stage)
➜ tree
.
├── README.md
└── aws
    ├── dreampay
    │   └── global
    ├── bitwin
    │   ├── dev
    │   ├── global
    │   ├── prod
    │   ├── stage
    │   └── uat
    ├── main.tf
    ├── modules
    │   ├── eks
    │   ├── elasticache
    │   ├── iam
    │   ├── networking
    │   └── rds
    └── sparkSport
        ├── dev
        └── global
```

### 建置範例

下面展示 bitwin 帳號的環境建置。

```bash
cd aws # 必須在第二層中執行命令, 要使用到 aws/main.tf 引入 required_providers
terraform apply -state=bitwin/global/global.tfstate bitwin/global # 執行全域配置
terraform apply -state=bitwin/dev/dev.tfstate bitwin/dev # 執行 dev 環境配置
terraform apply -state=bitwin/stage/stage.tfstate bitwin/stage # 執行 stage 環境配置
terraform apply -state=bitwin/uat/uat.tfstate bitwin/uat # 執行 uat 環境配置
terraform apply -state=bitwin/prod/prod.tfstate bitwin/prod # 執行 prod 環境配置
```

### 移除範例

下面展示 bitwin 帳號的環移除。

```bash
cd aws # 必須在第二層中執行命令, 要使用到 aws/main.tf 引入 required_providers
terraform destroy -state=bitwin/global/global.tfstate bitwin/global # 執行全域配置
terraform destroy -state=bitwin/dev/dev.tfstate bitwin/dev # 執行 dev 環境配置
terraform destroy -state=bitwin/stage/stage.tfstate bitwin/stage # 執行 stage 環境配置
terraform destroy -state=bitwin/uat/uat.tfstate bitwin/uat # 執行 uat 環境配置
terraform destroy -state=bitwin/prod/prod.tfstate bitwin/prod # 執行 prod 環境配置
```

### 匯入範例

匯入現有的 rds 為範例

```bash
cd aws # 必須在第二層中執行命令, 要使用到 aws/main.tf 引入 required_providers
terraform import -state=bitwin/dev/dev.tfstate -config=bitwin/dev module.rds.aws_db_instance.db_instance database-dev # 引入 dev 環境的 rds
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

