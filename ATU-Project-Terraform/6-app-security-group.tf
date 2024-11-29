# Create Security Group - SSH
resource "aws_security_group" "public_subnet" {
  name        = "vpc-ssh"
  description = "Dev VPC SSH"
  vpc_id = aws_vpc.main.id
  	  
  ingress {
    description      = "Allow Port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  
  }
  
  egress {
    description      = "Allow all ip and ports outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "public-vpc-ssh-sg"
  }
}


resource "aws_security_group" "private_subnet" {
  name        = "private-sg"
  description = "Private subnet security group "
  vpc_id = aws_vpc.main.id
  	
  ingress {
    description      = "Allow Port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    #cidr_blocks      = [aws_security_group.public_subnet]  # only bastion server allowed SSH into it
    security_groups = [aws_security_group.public_subnet.id] # Only accepting ssh from Bastion server
  }
  
  ingress {
    description      = "Allow Port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  
  }

  egress {
    description      = "Allow all ip and ports outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "private-vpc-sg"
  }
}

