resource "aws_iam_openid_connect_provider" "github_actions_oidc" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}

output "github_actions_oidc_arn" {
  value = aws_iam_openid_connect_provider.github_actions_oidc.arn
}