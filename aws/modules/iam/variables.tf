variable "policies" {
  description = "定義 policies"
  default = {}
}

variable "roles" {
  description = "定義 roles"
  default = {}
}

variable "roles_policy_attachment" {
  description = "定義 roles policy"
  default = {}
}

variable "groups" {
  description = "定義系統群組"
  default = {}
}

variable "groups_membership" {
  description = "定義系統群組帳戶(帳戶會自動建立)"
  default = {}
}
