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

# Start and enable Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Grafana is installed and running on port 3000."
