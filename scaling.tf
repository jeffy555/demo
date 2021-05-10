resource "aws_db_instance" "mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = var.dbname
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.mysql.id]
  db_subnet_group_name   = aws_db_subnet_group.mysql.name
  skip_final_snapshot    = true
  
}


resource "aws_launch_configuration" "launchme" {
  name          = "web_config"
  image_id      = "ami-0ee02acd56a52998e"
  instance_type = "t2.medium"
  security_groups = [aws_security_group.web.id]
  user_data = <<-EOF
#!/bin/bash
sudo yum update -y 
sudo yum install -y httpd24 php72 mysql57-server php72-mysqlnd
sudo service httpd start 
sudo chkconfig httpd on 
sudo usermod -a -G apache ec2-user 
sudo chown -R ec2-user:apache /var/www 
sudo chmod 2775 /var/www 
find /var/www -type d -exec sudo chmod 2775 {} \; find /var/www -type f -exec sudo chmod 0664 {} \; 
echo “<?php phpinfo(); ?>” > /var/www/html/phpinfo.php
EOF
}

resource "aws_autoscaling_group" "bar" {
  name                      = "autoscale"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.launchme.name
  vpc_zone_identifier = [aws_subnet.public1.id, aws_subnet.public2.id]
  
 }

