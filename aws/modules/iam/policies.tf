resource "aws_iam_policy" "policies" {
  for_each = var.policies
  name        = each.key
  path        = "/"
  description = "create by terrafrom"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = each.value
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

