# Create a VPC
resource "aws_vpc" "ec2_project" {

  cidr_block = "10.0.0.0/16"

tags = {
  name = "ec2_project_Project_sample"
}
}

# Create security group for ec2 
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.ec2_project.id

  # Allow traffic on port 80
  ingress = {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_block = "10.0.0.0/16"
  }

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block = ["0.0.0.0/0"]
  }
}

# Create a subnet1
resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.ec2_project.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

}

# Create subnet2
resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.ec2_project.id
   cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1b"
}

# Create IGW and attach it to the VPC
resource "aws_internet_gateway" "ec2_project_igw" {
  vpc_id = aws_vpc.ec2_project.id
  
}

# Create route table (rt)
resource "aws_route_table" "ec2_project_rt" {
  vpc_id = aws_vpc.ec2_project.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2_project_igw.id
  }
}

# Create route table association (rta)
resource "aws_route_table_association" "ec2_project_rta" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.ec2_project_rt.id
  gateway_id = aws_internet_gateway.ec2_project_igw.id
}

