# AWS EKS

建立 Elastic Kubernetes service.

## Usage

在 `main.tf` 中使用 aws eks 模組的 yaml 範例.

```yaml
module "eks" {
  source = "../modules/eks"
  cluster_name = "dev_eks"
  cluster_version = "1.18"
  cluster_role_name = "AWSEKSClusterRole"
  cluster_public_access_cidrs = ["1.34.113.121/32", "1.34.111.162/32"]
  node_group_name = "dev_node_group"
  node_role_name = "AWSEKSNodeGroup"
  # 下面帶入 module.network 模組資訊
  cluster_subnet_ids = module.network.public_subnet_ids
  node_subnet_ids = module.network.private_subnet_ids
}

```

### Output

輸出有下列參數, 可提供其他 module 使用.
