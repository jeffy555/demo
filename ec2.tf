module "website_ec2" {
  source = "s3::https://terraform-modules-jefferson.s3.ap-south-1.amazonaws.com/aws-ec2-static.zip"  # Mandatory
  ami           = var.ami # ap-south-1
  instance_type = var.instance_type
  availability_zone = var.availability_zone
}
