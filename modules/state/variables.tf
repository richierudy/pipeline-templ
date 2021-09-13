variable "aws_profile" {
  type        = string
  description = "Aws profile"
}

variable "state_bucket_name" {
  type        = string
  description = "The name of bucket that will be used to managed terraform state"
  default     = "jenkins-pipeline-s3-store"
}

variable "state_table_name" {
  type        = string
  description = "The name of dynamo db table that will be used to store terraform state lock"
  default     = "jenkins-pipeline"
}

variable "aws_region" {
  type        = string
  description = "Used AWS Region."
}

variable "project_name" {
  type        = string
  description = "Name of VPC to be created. Here this is used to tag the s3 bucket"
}


variable "owner_name" {
  type        = string
  description = "The name of the owner tag for this resources"
}

variable "environment_name" {
  type        = string
  description = "The name of the environment this infrastructure will be deployed in e.g dev, qa, preprod or prod"
}

variable "shared_cred_file" {
  type        = string
  default     = "~/.aws/credentials"
  description = "The complete filename including path of where your aws credentials are store. This value is usually configure with [aws config] command"
}

