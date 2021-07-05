# AWS IAM

建立自訂 iam.

## Usage

在 `main.tf` 中使用 aws iam 模組的 yaml 範例.

此範例會建立:

1. roles 並配置 roles policy 權限.
2. groups 並配置 group policy 權限.
3. users 並自動加入到 group 中.

```yaml
module "iam" {
  source = "../modules/iam"
  policies = {
    "AWSEKSClusterLoadBalancerCreation" = ["ec2:DescribeAccountAttributes", "ec2:DescribeInternetGateways"]
  }
  roles = {
    "AWSEKSClusterRole" = "eks.amazonaws.com"
    "AWSEKSNodeGroup" = "ec2.amazonaws.com"
  }
  roles_policy_attachment = {
    "AWSEKSClusterRole" = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AWSEKSClusterLoadBalancerCreation"]
    "AWSEKSNodeGroup" = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
  }
  groups = {
    "administrator" = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  }
  groups_membership = {
    "administrator" = ["Jarvis.Hearts"]
  }
}
```

### Output

輸出有下列參數, 可提供其他 module 使用.

1. groups (list)
2. users (list)
3. group_membership (map)
