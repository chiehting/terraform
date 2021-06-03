variable "name" {
  description = "定義資料庫名稱"
  type = string
  default = null
}

variable "identifier" {
  description = "定義identifier"
  type = string
  default = null
}

variable "allocated_storage" {
  description = "定義儲存空間大小,單位gibibytes"
  type = number
  default = 100
}

variable "storage_type" {
  description = "定義儲存類型"
  type = string
  default = "gp2"
}
variable "engine" {
  description = "定義資料庫引擎"
  type = string
  default = "mysql"
}

variable "engine_version" {
  description = "定義資料庫版本"
  type = string
  default = "5.7"
}

variable "instance_class" {
  description = "定義主機規格"
  type = string
  default = "db.t2.micro"
}
variable "username" {
  description = "定義使用者名稱"
  type = string
  default = null
}
variable "password" {
  description = "定義使用者密碼"
  type = string
  default = null
}
variable "backup_retention_period" {
  description = "定義備份"
  type = number
  default = 5
}

variable "publicly_accessible" {
  description = "定義開放外部連線"
  type = bool
  default = true
}

variable "port" {
  description = "定義port"
  type = number
  default = 3306
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
