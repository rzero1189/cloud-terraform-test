variable "instancias" {
  description = "Nombre de las instancias"
  type        = list(string)
  default     = ["apache"]
}

resource "aws_instance" "public_instance" {
  //count                  = length(var.instancias)
  for_each               = toset(var.instancias)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/usrdata.sh")
  tags = {
    //"Name" = var.instancias[count.index]
    "Name" = "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "monitoring_instance" {
  count                  = var.enable_monitoring ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/usrdata.sh")
  tags = {
    "Name" = "Monitoreo-${local.sufix}"
  }
}