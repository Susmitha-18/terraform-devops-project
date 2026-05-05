# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_instance" "example" {
#   ami           = "ami-0f58b397bc5c1f2e8"
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Terraform-EC2"
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_instance" "windows" {
#   ami           = "ami-0b5eea76982371e91"
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Terraform-Windows-EC2"
#   }
# }

# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_instance" "tags_test" {
#   ami           = "ami-0f58b397bc5c1f2e8"
#   instance_type = "t3.micro"
# }

# resource "aws_ebs_volume" "example" {
#   availability_zone = "ap-south-1a"
#   size              = 40
# }

# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.example.id
#   instance_id = aws_instance.tags_test.id
# }

# provider "aws" {
#   region = "ap-south-1"
# }

# variable "instance_type" {
#   default = "t3.micro"
# }

# resource "aws_instance" "example" {

#   count         = 2
#   ami           = "ami-0f58b397bc5c1f2e8"
#   instance_type = var.instance_type
# }
# output "public_ip" {
#   value = aws_instance.example[*].public_ip
# }

# resource "aws_instance" "example" {
#   for_each = {
#     dev  = "t3.micro"
#     prod = "t3.micro"
#   }

#   ami           = "ami-0f58b397bc5c1f2e8"
#   instance_type = each.value

#   tags = {
#     Name = each.key
#   }
# }

# data "aws_ami" "latest" {
#   most_recent = true

#   owners = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*"]
#   }
# }

# resource "aws_instance" "example" {
#   for_each = {
#     dev  = "t3.micro"
#     prod = "t3.micro"
#   }

#   ami           = data.aws_ami.latest.id
#   instance_type = each.value

#   tags = {
#     Name = each.key
#   }
# }

# output "ami_used" {
#   value = data.aws_ami.latest.id
# }

# 

provider "aws" {
  region = "ap-south-1"
}

module "dev" {
  source         = "./ec2-module"
  ami            = "ami-0f58b397bc5c1f2e8"
  instance_type  = "t3.micro"
  name           = "dev-server"
}

module "prod" {
  source         = "./ec2-module"
  ami            = "ami-0f58b397bc5c1f2e8"
  instance_type  = "t3.micro"
  name           = "prod-server"
}
module "test" {
  source        = "./ec2-module"
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"
  name          = "test-server"
}