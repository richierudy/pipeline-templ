provider "aws" {
  region                  = var.aws_region
  version                 = "~> 2.0"
  shared_credentials_file = var.shared_cred_file
}

terraform {
  required_version = ">= 0.12.9"
}

provider "random" {
  version = "~> 2.1"
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}

provider "kubernetes" {}