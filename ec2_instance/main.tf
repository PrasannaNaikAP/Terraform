resource "aws_vpc" "vpc_1" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id             = aws_vpc.vpc_1.id
  cidr_block         = var.subnet_cidr_block
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "igw_1" {
  vpc_id = aws_vpc.vpc_1.id
  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.vpc_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_1.id
  }
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "rt_assoc_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table_1.id
}

resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet_1.id
  tags = {
    Name = var.instance_name
  }
}

output "instance_public_ip" {
  value = aws_instance.instance.private_ip
}
