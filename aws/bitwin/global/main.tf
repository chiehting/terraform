data "aws_caller_identity" "current" {}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}

module "iam" {
  source = "../modules/iam"
  policies = {
    "AWSEKSClusterLoadBalancerCreation" = ["ec2:DescribeAccountAttributes", "ec2:DescribeInternetGateways"]
  }
  roles = {
    "AWSEKSClusterRole-ap-southeast-1" = "eks.amazonaws.com"
    "AWSEKSNodeGroup-ap-southeast-1" = "ec2.amazonaws.com"
  }
  roles_policy_attachment = {
    "AWSEKSClusterRole-ap-southeast-1" = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/AWSEKSClusterLoadBalancerCreation"]
    "AWSEKSNodeGroup-ap-southeast-1" = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
  }
  groups = {
    "administrator" = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  }
  groups_membership = {
    "administrator" = ["Jarvis.Hearts"]
  }
}
