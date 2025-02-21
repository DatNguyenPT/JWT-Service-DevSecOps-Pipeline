resource "aws_eip" "jenkins_master_eip" {
  instance = aws_instance.jenkins_master.id
  tags = {
    name = "Jenkins Master EIP"
  }
}

resource "aws_eip_association" "jenkins_master_eip_asso" {
  instance_id   = aws_instance.jenkins_master.id
  allocation_id = aws_eip.jenkins_master_eip.id
}


resource "aws_eip" "sonarqube_server_eip" {
  instance = aws_instance.sonarqube_server.id
  tags = {
    name = "Sonarqube Server EIP"
  }
}

resource "aws_eip_association" "sonarqube_server_eip_asso" {
  instance_id   = aws_instance.sonarqube_server.id
  allocation_id = aws_eip.sonarqube_server_eip.id
}

resource "aws_eip" "database_server_eip" {
  instance = aws_instance.database_server.id
  tags = {
    name = "Database Server EIP"
  }
}

resource "aws_eip_association" "database_server_eip_asso" {
  instance_id   = aws_instance.database_server.id
  allocation_id = aws_eip.database_server_eip.id
}

resource "aws_eip" "monitoring_eip" {
  instance = aws_instance.monitoring.id
  tags = {
    name = "Monitoring EIP"
  }
}

resource "aws_eip_association" "monitoring_eip_asso" {
  instance_id   = aws_instance.monitoring.id
  allocation_id = aws_eip.monitoring_eip.id
}
