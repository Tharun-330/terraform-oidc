
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "web" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name

  user_data = file("${path.module}/nginx.sh")

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge({
    Name = "tf-ubuntu-22-04-${count.index + 1}"
  }, var.tags)
}

/*
locals {
  device_letters = ["f","g","h","i","j","k","l"]
}

resource "aws_ebs_volume" "additional" {
  count             = var.additional_ebs_count
  availability_zone = aws_subnet.public[0].availability_zone
  size              = var.additional_ebs_size
  type              = "gp3"

  tags = merge({
    Name = "tf-add-ebs-${count.index + 1}"
  }, var.tags)
}

resource "aws_volume_attachment" "attach" {
  count       = var.additional_ebs_count
  device_name = "/dev/sd${local.device_letters[count.index]}"
  volume_id   = aws_ebs_volume.additional[count.index].id
  instance_id = aws_instance.web.id
  force_detach = true
}

*/