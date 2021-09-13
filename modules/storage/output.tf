output "database_readonly_url" {
  description = "Database readonly endpoint url"
  value       = join("", aws_rds_cluster.default.*.reader_endpoint)
}

output "database_writable_url" {
  description = "Database writable endpoint url"
  value       = join("", aws_rds_cluster.default.*.endpoint)
}

output "all_instance_endpoints_list" {
  value = [concat(
    aws_rds_cluster_instance.database.*.endpoint,
    aws_rds_cluster_instance.database.*.endpoint,
  )]
}

output "cluster_identifier" {
  value = join("", aws_rds_cluster.default.*.id)
}

output "database_name" {
  value = aws_rds_cluster.default.database_name
}
