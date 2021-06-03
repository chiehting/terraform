locals {
  role_policy_attachment = flatten([
    for role in keys(var.roles_policy_attachment) : [
      for policy in var.roles_policy_attachment[role] : {
        role  = role
        policy = policy
      }
    ]
  ])
}

resource "aws_iam_role" "roles" {
  for_each = var.roles
  name = each.key
  description = "create by terrafrom"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "${each.value}"
        }
      }
    ]
  }
  EOF

  depends_on = [
    aws_iam_policy.policies
  ]
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  count = length(local.role_policy_attachment)
  role = local.role_policy_attachment[count.index].role
  policy_arn = local.role_policy_attachment[count.index].policy
  depends_on = [
    aws_iam_role.roles
  ]
}

