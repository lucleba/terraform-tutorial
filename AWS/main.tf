# document: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build
# terraform Setting
# bao gồm các nhà cung cấp bắt buộc mà Terraform sẽ sử dụng để cung cấp cơ sở hạ tầng của bạn.
terraform {
  # mỗi provider chứa thuộc tính source  xác định tên máy chủ tùy chọn, không gian tên và loại nhà cung cấp.
  # https://developer.hashicorp.com/terraform/language/providers/requirements
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

#  A provider là 1 plugin mà Terraform sử dụng để tạo và quản lý resources.
#In this example: The AMI ID được chỉ định đến [us-west-2] region. 
provider "aws" {
  region = "us-east-1"
}



# resource blocks định nghĩa các thành phần của  infrastructure. 
# resource có thể là thành phần vật lý hoặc ảo, chẳng hạn như EC2 hoặc có thể là tài nguyên logic, chẳng hạn như ứng dụng Heroku.
#  resource type and the resource name.   <==>  "aws_instance" "app_server"  ===> unique ID: aws_instance.app_server
resource "aws_instance" "app_server" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"

  tags = {
    # Name = "AppServerInstanceResource"
    Name = var.instance_name  # refer to variable.tf file.
  }
}
