#!/bin/bash
set -e  # Exit on error

# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Add Grafana APT repository
echo "Adding Grafana repository..."
sudo apt-get install -y software-properties-common wget gpg
wget -q -O - https://packages.grafana.com/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/grafana-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/grafana-archive-keyring.gpg] https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Update repositories and install Grafana
sudo apt-get update -y
sudo apt-get install -y grafana

# Configure Grafana provisioning directory
sudo mkdir -p /etc/grafana/provisioning/datasources
sudo chown -R grafana:grafana /etc/grafana

# Add Prometheus data source provisioning file
echo 'apiVersion: 1
datasources:
    - name: Prometheus
    type: prometheus
    access: proxy
    url: http://${aws_instance.prometheus_instance.public_ip}:9090
    isDefault: true
    jsonData:
        timeInterval: 5s' | sudo tee /etc/grafana/provisioning/datasources/prometheus.yml

# Start and enable Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Grafana is installed and running on port 3000."