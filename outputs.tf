output "iam_role_arn" {
  value       = aws_iam_role.github_actions_ec2_admin.arn
  description = "IAM Role arn"
}