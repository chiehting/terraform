# Output variable definitions
output "groups" {
  description = "建立群組"
  value = keys(var.groups)
}

output "users" {
  description = "建立用戶"
  value = local.users
}

output "group_membership" {
  description = "用戶所加入的群組"
  value = var.groups_membership
}
