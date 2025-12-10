
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.25.0"
    }
  }

  backend "s3" {
    bucket = "devopsify-remote-state"
    key    = "vpc/roboshop"
    region = "us-east-1"
    #dynamodb_table = "devopsify-locking"
    use_lockfile   = true
  }
}




provider "aws" {
  # Configuration options
}