resource "aws_instance" "iac-ec2-instance" {
  ami = var.image
  instance_type = var.instancetype
  key_name = var.key_pair
  security_groups = var.sg
  subnet_id= var.subnet
  root_block_device{
    volume_type = "gp2"
    volume_size = var.vol_size
    delete_on_termination = true
  }
  tags = {
        Name = "iac-ec2-${var.environment}"
        created_by = "Camilo Ruiz"
        Project = "iac-intership"
    }
}

