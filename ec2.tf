module "ec2" {
  source  = "app.terraform.io/tf-mycloud/ec2/aws"
  version = "1.0.0"
  ami           = var.ami # ap-south-1
  instance_type = var.instance_type
  availability_zone = var.availability_zone
}
