# AWS Provider
provider "aws" {
  region = "eu-west-1"
}

# Grafana Instance

resource "aws_instance" "grafana_instance" {
  ami                         = var.app_ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.my_super_duper_secret_key
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-nsg-grafana.id]

  user_data = <<-EOT
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
                  EOT

  tags = {
    Name = "pre-assignment-kagan-tf-app-grafana"
  }
}

# Grafana Security Group

resource "aws_security_group" "pre-assignment-kagan-tf-nsg-grafana" {
  name        = "pre-assignment-kagan-tf-nsg-grafana"
  description = "Security group allowing SSH, port 3000"

  ingress {
    description = "Allow SSH from localhost"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  ingress {
    description = "Allow 3000 from localhost"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.public_cidr_block
  }
}

# Prometheus Instance

resource "aws_instance" "prometheus_instance" {
  ami                         = var.app_ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.my_super_duper_secret_key
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-nsg-prometheus.id]

  user_data = <<-EOT
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
                  EOT

  tags = {
    Name = "pre-assignment-kagan-tf-app-prometheus"
  }
}

# Prometheus Security Group

resource "aws_security_group" "pre-assignment-kagan-tf-nsg-prometheus" {
  name        = "pre-assignment-kagan-tf-nsg-prometheus"
  description = "Security group allowing SSH, port 3000"

  ingress {
    description = "Allow SSH from localhost"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  ingress {
    description = "Allow HTTP traffic to Prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  ingress {
    description = "Allow HTTP traffic to Prometheus Node Exporter"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.public_cidr_block
  }
}

# Output Grafana URL as a clickable link (in Markdown)

output "grafana_dashboard" {
  description = "URL to Grafana Dashboard"
  value       = "Grafana Dashboard: http://${aws_instance.grafana_instance.public_ip}:3000"
}

output "prometheus_dashboard" {
  description = "URL to Prometheus Dashboard"
  value       = "Prometheus Dashboard: http://${aws_instance.prometheus_instance.public_ip}:9090"
}

output "node_exporter_dashboard" {
  description = "URL to Node Exporter Dashboard"
  value       = "Node Exporter Dashboard: http://${aws_instance.prometheus_instance.public_ip}:9100"
}