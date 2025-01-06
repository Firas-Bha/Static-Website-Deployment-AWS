# Specify the provider
provider "aws" {
  access_key = var.aws_access_key    # Use the variable for access key
  secret_key = var.aws_secret_key    # Use the variable for secret key
  region     = var.aws_region        # Use the variable for region
}

# Create an S3 bucket for static website hosting
resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name

  tags = {
    Name = "StaticWebsiteBucket"
  }
}

# Configure the static website hosting for the S3 bucket
resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
}

# Add a bucket policy to make content publicly accessible
# Add a bucket policy to make content publicly accessible
resource "aws_s3_bucket_policy" "public_access_policy" {
  bucket = aws_s3_bucket.static_website.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.static_website.id}/*"
      }
    ]
  })
}

# Upload the static website content from the s3_content folder
resource "aws_s3_object" "static_website_files" {
  for_each = fileset("${path.module}/s3_content", "**") # Get all files in the s3_content directory
  bucket   = aws_s3_bucket.static_website.id
  key      = each.value
  source   = "${path.module}/s3_content/${each.value}" # Upload each file
  
}

