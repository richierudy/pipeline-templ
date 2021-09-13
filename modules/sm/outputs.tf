output "aurora_mysql_admin_username" {
  value = jsondecode(aws_secretsmanager_secret_version.db_credentials.secret_string)["admin_username"]
}

output "aurora_mysql_admin_password" {
  value = jsondecode(aws_secretsmanager_secret_version.db_credentials.secret_string)["admin_password"]
}
