# VPC Resource
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "ATU-vpc"
  }
}



resource "aws_subnet" "public_subnets" {
  depends_on = [
    aws_vpc.main
  ]
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.public_subnet_cidrs 
 availability_zone = var.azs 
 map_public_ip_on_launch = true
 
 tags = {
   Name = "Public-Subnet"
 }
}



resource "aws_subnet" "private_subnets" {
  depends_on = [
    aws_vpc.main
  ]
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.private_subnet_cidrs 
 availability_zone = var.azs 
 
 tags = {
   Name = "Private-Subnet"
 }
}




