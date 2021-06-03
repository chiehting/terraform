variable "cluster_name" {
  description = "定義 cluster 名稱"
  type = string
  default = null
}

variable "cluster_version" {
  description = "定義 cluster version"
  type = string
  default = null
}

variable "cluster_role_name" {
  description = "定義 cluster role 名稱"
  type = string
  default = null
}

variable "cluster_public_access_cidrs" {
  description = "定義 cluster public access cidrs"
  type = list
  default = null
}

variable "cluster_subnet_ids" {
  description = "定義 cluster subnet ids"
  type = list
  default = null
}

variable "node_group_name" {
  description = "定義 cluster 的 node group 名稱"
  type = string
  default = null
}

variable "node_role_name" {
  description = "定義 node group role 名稱"
  type = string
  default = null
}

variable "node_subnet_ids" {
  description = "定義 node subnet ids"
  type = list
  default = null
}
