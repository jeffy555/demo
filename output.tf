## S3 Bucket ARN
output "website_bucket_arn" {
  description = "ARN of the bucket"
  value = module.website_s3_bucket.arn 
}

## S3 Bucket Name
output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value = module.website_s3_bucket.name
}

## S3 Bucket Domain
output "website_bucket_domain" {
  description = "Name (id) of the bucket"
  value = module.website_s3_bucket.domain
}

## S3 Bucket Endpoint
output "website_bucket_endpoint" {
  description = "Name (id) of the bucket"
  value = module.website_s3_bucket.endpoint
}

output "website_bucket_ec2_private_ip" {
  description = "Private IP for ec2 instance"
  value = module.website_ec2.ec2_private_ip
}