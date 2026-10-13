# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"  # Set AWS region to US East 1 (N. Virginia)
}

terraform {
  backend "s3" {
    bucket         = "cw-tf-state-bucket"
    key            = "activity/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}

# EC2 instance resource definition
resource "aws_instance" "my_server" {
   ami           = data.aws_ami.amazonlinux.id  # Use the AMI ID from the data source
   instance_type = var.instance_type            # Use the instance type from variables

   # Add tags to the EC2 instance for identification
   tags = {
     Name = "my ec2"
   }
}
