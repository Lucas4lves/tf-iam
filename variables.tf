variable "iam_role_region" {
  type    = string
  default = "us-east-1"
}
variable "iam_role_name" {
  type    = string
  default = ""
}

variable "iam_role_policy_name" {
  type    = string
  default = ""
}

variable "iam_role_tags" {
  type    = map(string)
  default = {}
}

variable "oidc_arn" {
  type = string
}

variable "github_owner" {
  type    = string
  default = ""
}

variable "ec2_policy_name" {
  type    = string
  default = ""
}