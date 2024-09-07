# Configure backend for state management
terraform {
  backend "s3" {
    bucket         = "u620"
    key            = "statefile.tfstate"
    dynamodb_table = "terraform-state-lock-table"
    encrypt        = true
    profile = "oidc"
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "oidc"
}

resource "aws_sqs_queue" "queue" {
  name = "sample-queue"
}