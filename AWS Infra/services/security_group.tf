# Common security group for basic access
resource "aws_security_group" "common" {
  name        = "common_access"
  description = "Common security group for basic access"
  vpc_id      = aws_vpc.main_vpc.id

  # SSH access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Common Security Group"
  }
}


# Jenkins security group
resource "aws_security_group" "jenkins" {
  name        = "jenkins_access"
  description = "Security group for Jenkins server"
  vpc_id      = aws_vpc.main_vpc.id

  # Jenkins web interface
  ingress {
    description = "Jenkins Web"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Jenkins JNLP port
  ingress {
    description = "Jenkins JNLP"
    from_port   = 50000
    to_port     = 50000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins Security Group"
  }
}

# SonarQube security group
resource "aws_security_group" "sonarqube" {
  name        = "sonarqube_access"
  description = "Security group for SonarQube server"
  vpc_id      = aws_vpc.main_vpc.id

  # SonarQube web interface
  ingress {
    description = "SonarQube Web"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SonarQube Security Group"
  }
}

# Database security group
resource "aws_security_group" "database" {
  name        = "database_access"
  description = "Security group for Database server"
  vpc_id      = aws_vpc.main_vpc.id

  # PostgreSQL
  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Only allow access within VPC
  }

  # MySQL/MariaDB
  ingress {
    description = "MySQL/MariaDB"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Only allow access within VPC
  }

  tags = {
    Name = "Database Security Group"
  }
}

# Monitoring security group
resource "aws_security_group" "monitoring" {
  name        = "monitoring_access"
  description = "Security group for Monitoring server"
  vpc_id      = aws_vpc.main_vpc.id

  # Prometheus
  ingress {
    description = "Prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Grafana
  ingress {
    description = "Grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Node Exporter
  ingress {
    description = "Node Exporter"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Only allow access within VPC
  }

  tags = {
    Name = "Monitoring Security Group"
  }
}