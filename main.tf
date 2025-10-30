data "aws_iam_policy_document" "gh_actions_oidc_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]


    principals {
      type        = "Federated"
      identifiers = [var.oidc_arn]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_owner}/*"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ec2_permissions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*", "iam:PassRole"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_policy" {
  name   = var.ec2_policy_name
  policy = data.aws_iam_policy_document.ec2_permissions.json
}

resource "aws_iam_role" "github_actions_ec2_admin" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.gh_actions_oidc_trust.json

  tags = var.iam_role_tags
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.github_actions_ec2_admin.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}
