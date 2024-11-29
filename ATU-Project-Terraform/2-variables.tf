# Region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "Main VPC CIDR Block"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
 type        = string 
 description = "Public Subnet CIDR values"
 default     = "10.0.1.0/24"
}
 
variable "private_subnet_cidrs" {
 type        = string 
 description = "Private Subnet CIDR values"
 default     = "10.0.2.0/24"
}


# Create subnets in different AZs
variable "azs" {
 type        = string 
 description = "Availability Zones"
 default     = "us-east-1a"
}


# Create Instance type
variable "instance_type" {
 type        = string 
 description = "Instance Type"
 default     = "t2.micro"
}

