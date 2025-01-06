variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "static-website-mybucket"
 }
variable "aws_access_key" {
  description = "AWS Access Key ID"
  type        = string
  default     = "your_aws_access_key"
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  type        = string
  default     = "your_aws_secretkey"
  sensitive   = true  # Mark as sensitive to avoid exposing in Terraform logs
}

variable "aws_region" {
  description = "AWS Region for resources"
  type        = string
  default     = "eu-central-1" 
}

