# AWS Network

會將預設網路服務押上 tag `Name=default`, 預設名稱定義在 variables.tf 中.

建立自訂義網段.

## Usage

在 `main.tf` 中使用 aws network 模組的 yaml 範例.

```yaml
module "network" {
  source = "../modules/network"
  vpc_cidr_block = "10.0.0.0/16"
  availability_zone = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  tags = {
    "Name" = "dev"
  }
}
```

### Output

輸出有下列參數, 可提供其他 module 使用.

1. public_subnet_ids (list)
2. private_subnet_ids (list)
3. eip_public_ip (string)
