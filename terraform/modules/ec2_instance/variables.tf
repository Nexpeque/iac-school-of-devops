variable "environment" {
  description = "Environment"
}
variable "image" {
  description = "Image ID"
}
variable "instancetype" {
  description = "Instance type"
}
variable "key_pair" {
  description = "key pair for instances and only for this project"
}
variable "vol_size" {
  description = "Volumen size"
}
variable "sg" {
  description = "security group id"
}
variable "subnet" {
  description = "subnet id"
}