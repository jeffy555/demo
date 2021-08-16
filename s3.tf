module "website_s3_bucket" {
  source = "s3::https://terraform-modules-jefferson.s3.ap-south-1.amazonaws.com/aws-ec2-static.zip"  # Mandatory
  bucket_name = var.my_s3_bucket
  tags = var.my_s3_tags
}
