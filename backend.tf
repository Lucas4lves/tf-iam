terraform {
  backend "s3" {
    bucket = "devops-tf-states-bucket"
    key    = "github-actions/iam-role.tfstate"
    region = "us-east-1"
  }
}