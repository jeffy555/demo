module "website_s3_bucket" {
  source = "s3://terraform-modules-jefferson/aws-s3-static.zip"  # Mandatory
  bucket_name = var.my_s3_bucket
  tags = var.my_s3_tags
}
