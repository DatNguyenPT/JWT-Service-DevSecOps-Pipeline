resource "aws_instance" "jenkins_master" {
  ami             = var.ami_id
  subnet_id       = aws_subnet.public_subnets[0].id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.generated_key.key_name

  root_block_device {
    volume_size = 80
  }

  user_data = base64encode(file("pre_setup.sh"))

  tags = {
    Name = "Jenkins Master"
  }
}


resource "aws_instance" "sonarqube_server" {
  ami             = var.ami_id
  subnet_id       = aws_subnet.public_subnets[0].id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.generated_key.key_name

  root_block_device {
    volume_size = 30
  }

  user_data = base64encode(file("pre_setup.sh"))

  tags = {
    Name = "Sonarqube server"
  }
}

resource "aws_instance" "database_server" {
  ami             = var.ami_id
  subnet_id       = aws_subnet.public_subnets[0].id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.generated_key.key_name

  root_block_device {
    volume_size = 30
  }

  user_data = base64encode(file("pre_setup.sh"))

  tags = {
    Name = "Database server"
  }
}

resource "aws_instance" "monitoring" {
  ami             = var.ami_id
  subnet_id       = aws_subnet.public_subnets[0].id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.generated_key.key_name

  root_block_device {
    volume_size = 30
  }

  user_data = base64encode(file("pre_setup.sh"))

  tags = {
    Name = "Monitoring"
  }
}

