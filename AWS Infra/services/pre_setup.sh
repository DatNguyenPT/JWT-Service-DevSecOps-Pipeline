#!/bin/bash
set -e  # Stop execution if any command fails

echo "========== Updating system =========="
sudo apt update -y && sudo apt upgrade -y

echo "========== Installing JDK 17 =========="
sudo apt install -y openjdk-17-jdk openjdk-17-jre

# Export JAVA_HOME permanently
JAVA_HOME_PATH=$(dirname $(dirname $(readlink -f $(which javac))))
echo "export JAVA_HOME=$JAVA_HOME_PATH" | sudo tee -a /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" | sudo tee -a /etc/profile
source /etc/profile  

# Verify Java installation
if java -version &>/dev/null; then
    echo "✅ Java installed successfully."
else
    echo "❌ Java installation failed!" && exit 1
fi

echo "========== Installing Jenkins =========="
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install -y jenkins
sudo systemctl start jenkins && sudo systemctl enable jenkins

# Verify Jenkins installation
if systemctl is-active --quiet jenkins; then
    echo "✅ Jenkins installed and running."
else
    echo "❌ Jenkins failed to start!" && exit 1
fi

echo "========== Installing Docker =========="
# Add Docker's official GPG key
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add "ubuntu" user to Docker group
sudo usermod -aG docker ubuntu

# Verify Docker installation
if docker --version &>/dev/null; then
    echo "✅ Docker installed successfully."
else
    echo "❌ Docker installation failed!" && exit 1
fi

# Final success message
echo "🎉 All installations completed successfully!"
