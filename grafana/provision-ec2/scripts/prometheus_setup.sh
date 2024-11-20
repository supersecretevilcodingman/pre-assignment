#!/bin/bash
set -e

# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Prometheus and Node Exporter
sudo apt-get install prometheus prometheus-node-exporter -y

# Start Prometheus and Node Exporter
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl start prometheus-node-exporter
sudo systemctl enable prometheus-node-exporter

echo "Prometheus and Node Exporter are running."