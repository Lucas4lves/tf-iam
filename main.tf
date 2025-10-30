resource "aws_iam_role" "github_actions_ec2_admin" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = var.iam_role_tags
}

resource "aws_iam_policy" "github_actions_ec2_admin_policy" {
  name = var.iam_role_policy_name
  policy = jsonencode({
    // TODO: policy definitionß
  })
}