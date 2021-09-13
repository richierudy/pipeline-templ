variable "aws_region" {
  type        = string
  description = "Used AWS Region."
}

variable "aws_profile" {
  type        = string
  description = "Aws profile"
}

variable "shared_cred_file" {
  type        = string
  default     = "~/.aws/credentials"
  description = "The complete filename including path of where your aws credentials are store. This value is usually configure with [aws configure] command"
}

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

variable "availability_zones" {
  type        = list
  description = "A list of availability zones this vpc spans across for HA"
}

variable "cidr_start" {
  type        = string
  description = "The first two elements of the cidr e.g 10.0 or 172.10"
}

variable "dhcp_domain_name" {
  type        = string
  description = "This the domain name used for dhcp"
}

variable "instance_type" {
  type        = string
  description = "Instance type for k8s installation instance"
}

variable "instance_class" {
  description = "The db instance class for this cluster"
  type        = string
}

variable "desired_capacity" {
  description = "Desired auto scailing capacity"
  default     = "3"
}

variable "max_size" {
  description = "maximum scale out number of instances"
  default     = "6"
}

variable "domain_name_servers" {
  type        = list
  description = "A list of name servers for resolving internal networking IP"
}

variable "db_version" {
  description = "Version of the db cluster to be created"
  type        = string
}

variable "db_engine" {
  description = "The engine [aurora-postgresql, aurora-mysql] of the db cluster to be created"
  type        = string
}

variable "backup_retention_period" {
  description = "The number of snapshot to be retain for this cluster"
  default     = 5
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list

  default = [

  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."

  default = [
    # {
    #   rolearn  = "arn:aws:iam::66666666666:role/role1"
    #   username = "role1"
    #   groups   = ["system:masters"]
    # },
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."

  default = [
    # {
    #   userarn  = "arn:aws:iam::66666666666:user/user1"
    #   username = "user1"
    #   groups   = ["system:masters"]
    # },
    # {
    #   userarn  = "arn:aws:iam::66666666666:user/user2"
    #   username = "user2"
    #   groups   = ["system:masters"]
    # },
  ]
}

variable "reclaim_policy" {
  description = "The claim policy of starageclass [Retain, Delete]"
  default     = "Delete"
}

variable "allow_volume_expansion" {
  description = "Determins whether storageclass volume is expandable"
  default     = true
}

variable "database_name" {
  description = "The name of the database that needs to be created for wordpress"
  type        = string
}

variable "enable_ingress_controller" {
  description = "Determines whether ingress-controller should be installed"
}

variable "enable_kube2iam" {
  description = "Whether kube2iam is enabled"
}

variable "enable_cicd" {
  description = "Whether Jenkins should provisioned or not"
}