variable "vpc" { default = "0" }
variable "az" { default = "us-east-1a" }
variable "environment" { default = "dev" }
variable "image" { default = "ami-b70554c8" }
variable "instancetype" { default = "t2.micro" }
variable "key_pair" { default = "cruiz" }
variable "vol_size" { default = "30" }