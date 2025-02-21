#!/bin/bash

# Download and extract node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz

# Move the binary to a proper location
sudo mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/

# Remove extracted folder and tarball
rm -rf node_exporter-1.5.0.linux-amd64 node_exporter-1.5.0.linux-amd64.tar.gz

# Create a system user for node_exporter
sudo useradd -rs /bin/false node_exporter

# Create a systemd service file
cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd, enable and start Node Exporter
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

echo "Node Exporter installed and running!"
