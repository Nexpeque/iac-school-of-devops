output "vpc_id" {
  value = aws_vpc.iac-vpc.id
}
output "pubsub_id_a" {
  value = aws_subnet.iac-PublicSubnet.id
}
output "sg-bastion_id" {
  value = aws_security_group.iac-Bastion-sg.id
}
output "instance_id" {
  value = module.ec2_instance.instance_id
}
output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip
}