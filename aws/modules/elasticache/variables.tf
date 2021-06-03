variable "cluster_id" {
  description = "定義名稱"
  type = string
  default = null
}
variable "engine" {
  description = "定義引擎"
  type = string
  default = "redis"
}
variable "node_type" {
  description = "定義節點規格"
  type = string
  default = "cache.t3.micro"
}
variable "num_cache_nodes" {
  description = "定義結點數量"
  type = number
  default = 1
}

variable "engine_version" {
  description = "定義版本"
  type = string
  default = "5.0.6"
}

variable "port" {
  description = "定義名稱"
  type = number
  default = 6379
}

variable "subnet_ids" {
  description = "subnet ids"
  type = list
  default = null
}

variable "security_group_cidr_blocks" {
  description = "安全組cidr"
  type = list
  default = ["0.0.0.0/0"]
}