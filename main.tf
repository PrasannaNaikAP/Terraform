provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

module "instance_1" {
  source = "/ec2_instance"
  providers = {
    aws = aws.us-east-1
  }
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
  ami_id = "ami-08a0d1e16fc3f61ea"

}

module "instance_2" {
  source = "/ec2_instance"
  providers = {
    aws = aws.us-east-2
  }
  vpc_cidr_block = "192.168.0.0/16"
  subnet_cidr_block = "192.168.1.0/24"
  ami_id = "ami-033fabdd332044f06"

}

