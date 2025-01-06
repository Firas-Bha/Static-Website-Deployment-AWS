# Output the S3 bucket URL
output "s3_bucket_url" {
  value = "http://${aws_s3_bucket.static_website.bucket_regional_domain_name}"
}

