variable "owner_name" {
  type        = string
  description = "The name of the owner tag for this resources"
}

variable "environment_name" {
  type        = string
  description = "The name of the environment this infrastructure will be deployed in e.g dev, qa, preprod or prod"
}

variable "project_name" {
  type        = string
  description = "The name of vpc or infrasture to be created"
}
