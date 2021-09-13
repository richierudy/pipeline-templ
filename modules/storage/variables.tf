variable "vpc_id" {
  description = "The vpc id this redis cluster will reside in"
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

variable "database_subnets" {
  description = "The subnets rds will be provisioned in"
  type        = list
}

variable "availability_zones" {
  description = "Availability zones used to lunch this instances"
  type        = list
}

variable "db_password" {
  description = "The master password of the rds db cluster"
  type        = string
}

variable "instance_class" {
  description = "The db instance class for this cluster"
  type        = string
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
}

variable "db_subnets_group_name" {
  description = "The db subnet group name"
  type        = string
}

variable "database_name" {
  description = "The primary database name"
  type        = string
}

variable "db_username" {
  description = "The mast username of the rds db cluster"
  type        = string
}

