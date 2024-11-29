# Bastion Host - EC2 Instance that will be created in VPC Public Subnet
resource "aws_instance" "public-ec2vm" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnets.id  
  security_groups = [aws_security_group.public_subnet.id] 
  tags = {
    "Name" = "Public-ec2"
  }
}



# EC2 Instances that will be created in VPC Private Subnets
resource "aws_instance" "private-ec2vm" {
  depends_on = [aws_vpc.main] 
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type  
  security_groups        = [aws_security_group.private_subnet.id]
  subnet_id              = aws_subnet.private_subnets.id 
  tags = {
    "Name" = "Private-ec2"
  }
}
