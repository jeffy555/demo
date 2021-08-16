resource "aws_instance" "demo" {
  ami           = var.ami # ap-south-1
  instance_type = var.instance_type
  availability_zone = var.availability_zone
}
