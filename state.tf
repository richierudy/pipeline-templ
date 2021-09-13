terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "jenkins-pipeline-s3-store"
    key            = "terraform.tfstate"
    encrypt        = "true"
    dynamodb_table = "jenkins-pipeline"
  }
}
