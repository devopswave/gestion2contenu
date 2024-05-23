output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.compute.instance_id
}

output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.database.db_endpoint
}

output "s3_bucket_id" {
  description = "The ID of the S3 bucket"
  value       = module.storage.bucket_id
}

output "iam_role_arn" {
  description = "The ARN of the IAM role"
  value       = module.iam.role_arn
}

output "monitoring_url" {
  description = "The URL for monitoring access"
  value       = module.monitoring.monitoring_url
}
