# terraform-container
This terraform code will create container using a Docker file and deploy it to AWS using Terraform.
I am using decated  AWS EC2. I am also including auto scaling to ensure healthy instances.

Below are the explanation for understanding

1) The code specifies the AWS provider and configures it to use the default profile and the ap-south-1 region.

2) The code defines a local variable, user_data, which contains the contents of the file.sh file in this file 
   i have define necessary requirements for this project that is updateiing the instance and then installing 
   lastest docker with nginx image app

3) The code creates an aws_launch_template resource called dev-app. The launch template has the following properties:
	
	A) name: The name of the launch template is set to dev-app.

  	B) image_id: The ID of the AMI to use for the EC2 instances launched from the launch template is set to ami-0f69bc5520884278e. 
	
	C) user_data: The user data for the launch template is set to the contents of the 
	file.sh file, encoded as a base64 string using the base64encode function.

	D) instance_type: The instance type for the EC2 instances launched from the launch template is set to t2.micro.

	E) vpc_security_group_ids: The ID of the security group to be associated with the EC2 instances launched from the launch template is set to sg-0b3400e6be382d35e.

	F) tags: The launch template is tagged with a Name tag, set to app-server.


	
4) The code creates an aws_autoscaling_group resource called dev-app. The auto scaling group has the following properties:
	A) name: The name of the auto scaling group is set to dev-app.



