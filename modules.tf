# AWS secret manager population of secrets
data "aws_caller_identity" "account" {}

module "sm" {
  source = "./modules/sm"

  owner_name       = var.owner_name
  project_name     = var.project_name
  environment_name = var.environment_name
}

module "vpc" {
  source = "./modules/vpc"

  cidr_start          = var.cidr_start
  availability_zones  = var.availability_zones
  owner_name          = var.owner_name
  project_name        = var.project_name
  environment_name    = var.environment_name
  dhcp_domain_name    = var.dhcp_domain_name
  domain_name_servers = var.domain_name_servers
}

# module "storage" {
#   source = "./modules/storage"

#   vpc_id                  = module.vpc.vpc_id
#   database_subnets        = module.vpc.database_subnets
#   availability_zones      = var.availability_zones
#   db_username             = module.sm.aurora_mysql_admin_username
#   db_password             = module.sm.aurora_mysql_admin_password
#   db_engine               = var.db_engine
#   db_version              = var.db_version
#   backup_retention_period = var.backup_retention_period
#   instance_class          = var.instance_class
#   db_subnets_group_name   = module.vpc.database_subnet_group
#   database_name           = var.database_name
#   owner_name              = var.owner_name
#   project_name            = var.project_name
#   environment_name        = var.environment_name
# }

module "eks" {
  source = "./modules/eks"

  vpc_id                    = module.vpc.vpc_id
  aws_region                = var.aws_region
  availability_zones        = var.availability_zones
  private_subnets           = module.vpc.private_subnets
  default_security_group_id = module.vpc.default_security_group_id
  instance_type             = var.instance_type
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  owner_name                = var.owner_name
  project_name              = var.project_name
  environment_name          = var.environment_name
  map_accounts              = var.map_accounts
  map_roles                 = var.map_roles
  map_users                 = var.map_users
}

module "nginx" {
  source = "./modules/nginx"

  enable_ingress_controller = var.enable_ingress_controller
  aws_region                = var.aws_region
  owner_name                = var.owner_name
  project_name              = var.project_name
  account_number            = data.aws_caller_identity.account.account_id
  environment_name          = var.environment_name
  work_iam_role_arn         = module.eks.worker_iam_role_arn
}

module "kube2iam" {
  source = "./modules/kube2iam"

  account_number       = data.aws_caller_identity.account.account_id
  base_role_arn        = "${module.eks.base_role_arn}/"
  worker_iam_role_name = module.eks.worker_iam_role_name
  work_iam_role_arn    = module.eks.worker_iam_role_arn
  enable_kube2iam      = var.enable_kube2iam
}

module "jenkins" {
  source = "./modules/cicd"

  enable_cicd = var.enable_cicd
}
