resource "aws_rds_cluster_instance" "database" {
  apply_immediately    = true
  count                = length(var.availability_zones)
  identifier           = "${var.database_name}-${count.index}"
  cluster_identifier   = aws_rds_cluster.default.id
  db_subnet_group_name = var.db_subnets_group_name
  instance_class       = var.instance_class
  publicly_accessible  = false
  engine               = var.db_engine
  engine_version       = var.db_version

  tags = {
    Terraform   = "true"
    Owner       = var.owner_name
    Environment = var.environment_name
    Name        = var.project_name
  }
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.project_name
  database_name           = var.database_name
  master_username         = var.db_username
  master_password         = var.db_password
  db_subnet_group_name    = var.db_subnets_group_name
  engine                  = var.db_engine
  engine_version          = var.db_version
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = "07:00-09:00"
  storage_encrypted       = true

  tags = {
    Terraform   = "true"
    Owner       = var.owner_name
    Environment = var.environment_name
    Name        = var.project_name
  }
}


