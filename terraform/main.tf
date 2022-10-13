terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

#--var-file=config/${ENV}.tfvars

######################## VPC ###############
resource "aws_vpc" "iac-vpc" {
  cidr_block           = "10.${var.vpc}.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name       = "iac-vpc"
    created_by = "Camilo Ruiz"
    Project    = "iac-intership"
  }
}

######################## Subnet ###############

resource "aws_subnet" "iac-PublicSubnet" {
  vpc_id                  = aws_vpc.iac-vpc.id
  availability_zone       = var.az
  cidr_block              = "10.${var.vpc}.0.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name       = "iac-PublicSubnet"
    created_by = "Camilo Ruiz"
    Project    = "iac-intership"
  }
}


##################### SECURITY GROUP ##############

resource "aws_security_group" "iac-Bastion-sg" {
  name   = "iac-Bastion-sg"
  vpc_id = aws_vpc.iac-vpc.id
  ingress {
    description = "Inet access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Access ssh admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name       = "iac-Bastion-sg"
    created_by = "Camilo Ruiz"
    Project    = "iac-intership"
  }
}


##################### Instance ##############

module "ec2_instance" {
  source       = "./modules/ec2_instance"
  environment  = var.environment
  image        = var.image
  instancetype = var.instancetype
  key_pair     = var.key_pair
  vol_size     = var.vol_size
  sg           = ["${aws_security_group.iac-Bastion-sg.id}"]
  subnet       = aws_subnet.iac-PublicSubnet.id

}