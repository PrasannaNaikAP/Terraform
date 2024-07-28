variable "vpc_name" {
  description = " VPC name"
  default     = "vpc_1"
}
variable "vpc_cidr_block" {
  description = " CIDR block for the VPC"
  default     = "10.0.0.0/16"
}


variable "subnet_name" {
  description = "name of the Subnet"
  default     = "subnet_1"
}


variable "subnet_cidr_block" {
  description = " CIDR block for the Subnet"
  default     = "10.0.1.0/24"
}


variable "igw_name" {
  description = " Internet Gateway"
  default     = "igw_1"
}

variable "route_table_name" {
  description = " Route Table"
  default     = "route_table_1"
}

variable "instance_name" {
  description = "EC2 Instance"
  default     = "instance"
}

variable "ami_id" {
  description =  "AMI to use for the instance"
  default     = "ami-08a0d1e16fc3f61ea"
}
