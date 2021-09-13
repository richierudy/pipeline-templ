aws_profile         = "707965404768"
aws_region          = "us-east-1"
project_name        = "jenkins-pipeline"
cidr_start          = "172.3"
owner_name          = "bsakweson"
environment_name    = "dev"
shared_cred_file    = "~/.aws/credentials"
availability_zones  = ["us-east-1b", "us-east-1c", "us-east-1d"]
dhcp_domain_name    = "ec2.internal"
instance_type       = "m4.large"
instance_class      = "db.t3.small"
domain_name_servers = ["AmazonProvidedDNS"]

# Database cluster
db_engine  = "aurora-mysql"
db_version = "5.7.mysql_aurora.2.04.2"

#StorageClass claim policy [Delete|Retain] default is [Delete]
reclaim_policy = "Delete"

enable_ingress_controller = true
enable_cicd               = true
enable_kube2iam           = false

database_name = "knights"