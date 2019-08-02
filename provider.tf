terraform {
  required_version = "~> 0.12.0"
}

// We need an AWS credentials
provider "aws" {
  region = "${var.region}"
}