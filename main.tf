provider "aws" {
  profile = "default"
  region  = "ap-south-1"

}

locals {
  user_data = file("file.sh")
}


resource "aws_launch_template" "dev-app" {
  name = "dev-app"
  image_id = "ami-0f69bc5520884278e"
  user_data = base64encode("${local.user_data}")
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0b3400e6be382d35e"]
   tags = {
      Name = "app-server"
    }



}


resource "aws_autoscaling_group" "dev-app" {
  name                      = "dev-app"
  min_size                  = 1
  max_size                  = 5
  desired_capacity          = 2
  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true
  availability_zones = ["ap-south-1a"]





# Use the launch template to create the EC2 instances
  launch_template {
    id      = "${aws_launch_template.dev-app.id}"
    version = "$Latest"
  }
    

  # Add any necessary tags
tag  {
 	key 	=   "app"
	value   = "dev-app"
  	 propagate_at_launch = true

    }
  }
