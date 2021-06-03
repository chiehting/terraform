locals {
  group_policy_attachment = flatten([
    for group in keys(var.groups) : [
      for policy in var.groups[group] : {
        group  = group
        policy = policy
      }
    ]
  ])

  users = flatten([
    for users in keys(var.groups_membership) :
      var.groups_membership[users]
  ])
}

resource "aws_iam_group" "groups" {
  for_each = var.groups
  name = each.key
}

resource "aws_iam_group_policy_attachment" "groups_policy" {
  count = length(local.group_policy_attachment)
  group = local.group_policy_attachment[count.index].group
  policy_arn = local.group_policy_attachment[count.index].policy
  depends_on = [
    aws_iam_group.groups
  ]
}

resource "aws_iam_user" "users" {
  count = length(distinct(local.users))
  name = distinct(local.users)[count.index]
}

resource "aws_iam_group_membership" "groups_membership" {
  for_each = var.groups_membership
  name = "${each.key}-group-membership"
  group = each.key
  users = each.value
  depends_on = [
    aws_iam_group.groups,
    aws_iam_user.users
  ]

  lifecycle {
    ignore_changes = [users]
  }
}
