variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-south-1"
}

## Create Variable for S3 Bucket Name
variable "my_s3_bucket" {
  description = "S3 Bucket name that we pass to S3 Custom Module"
  type = string
  default = "mybucket-1047-jeffersonimmanuel-05"
}

## Create Variable for S3 Bucket Tags
variable "my_s3_tags" {
  description = "Tags to set on the bucket"
  type = map(string)
  default = {
    Terraform = "true"
    Environment = "dev"
    newtag1 = "tag1"
    newtag2 = "tag2"
  }
}

variable "ami"{
  description = "Name of the ami"
  type = string
  default = "ami-0912f71e06545ad88"
}

variable "availability_zone"{
  description = "Az zone"
  type = string
  default = "ap-south-1b"
}

variable "instance_type"{
  description = "Instance type"
  type = string
  default = "t2.micro"
}