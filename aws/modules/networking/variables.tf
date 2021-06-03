variable "vpc_cidr_block" {
  description = "定義 vpc 網段"
  type = string
  default = null
}

variable "availability_zone" {
  description = "定義 AWS 可用區域"
  type = list
  default = null
}

variable "tags" {
  description = "tags"
  type = map(string)
  default = {}
}

variable "default_tags" {
  description = "default tags"
  type = map(string)
  default = {
    Name = "default"
  }
}
