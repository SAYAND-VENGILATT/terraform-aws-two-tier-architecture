terraform {
  backend "s3" {
    bucket = "terraform-backend-bucket"
    key    = "aws-2tier-iac/terraform.tfstate"
    region = "us-east-1"
  }
}
