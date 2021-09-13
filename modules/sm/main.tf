locals {
  aurara_mysql = {
    admin_username = random_string.aurara_mysql_admin_username.result
    admin_password = random_string.aurara_mysql_admin_password.result
  }
}

## Database credentials auto creation
resource "random_string" "aurara_mysql_admin_password" {
  length  = 24
  special = false
}

resource "random_string" "aurara_mysql_admin_username" {
  length  = 12
  special = false
}

resource "aws_secretsmanager_secret" "aurora_mysql" {
  name = "auroramysql"
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id     = aws_secretsmanager_secret.aurora_mysql.id
  secret_string = jsonencode(local.aurara_mysql)
}
