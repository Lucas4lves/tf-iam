terraform {
  backend "s3" {
    region = var.aws_region
    key    = "github-actions/oifc.tfstate"
    bucket = "devops-tf-states-bucket"
  }
}