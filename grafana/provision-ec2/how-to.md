- [Provisioning 2 EC2 instances with Grafana and Prometheus](#provisioning-2-ec2-instances-with-grafana-and-prometheus)
  - [main.tf File Breakdown](#maintf-file-breakdown)
    - [AWS Provider](#aws-provider)
    - [Creating the Grafana Instance Resource (First EC2 Instance)](#creating-the-grafana-instance-resource-first-ec2-instance)
    - [Creating the Grafana Instance Security Group Resource](#creating-the-grafana-instance-security-group-resource)
    - [Creating the Prometheus Instance Resource (Second EC2 Instance)](#creating-the-prometheus-instance-resource-second-ec2-instance)
    - [Creating the Prometheus Instance Security Group Resource](#creating-the-prometheus-instance-security-group-resource)
    - [Creating Outputs For Our URLs](#creating-outputs-for-our-urls)
  - [Bonus Section: Provisioning Prometheus as a Data Source on Grafana](#bonus-section-provisioning-prometheus-as-a-data-source-on-grafana)


# Provisioning 2 EC2 instances with Grafana and Prometheus

## main.tf File Breakdown

### AWS Provider
1. AWS Provider
- Configure the AWS provider to deploy resources in the `eu-west-1` region.

```
  provider "aws" {
    region = "eu-west-1"
  }
```

### Creating the Grafana Instance Resource (First EC2 Instance)
2. We need to set up the EC2 instance to have Grafana installed. We create a resource block for the AWS instance and then give it the following variables:
   - **AMI**: Specifies the Amazon Machine Image (AMI) ID to launch the EC2 instance.
   - **Instance Type**: Defines the type of instance to launch.
   - **Public IP Address**: Ensures the instance gets a public IP address so it can be accessed from the internet.
   - **Key Name**: Specifies the name of the SSH key pair to use for accessing the instance.
   - **VPC Security Group ID**: Attaches asecurity group to the instance for controlling inbound and outbound traffic.

```
resource "aws_instance" "grafana_instance" {
  ami                         = var.app_ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.my_super_duper_secret_key
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-nsg-grafana.id]
```

*Note! As you can see, we use variables. These are found in a `variable.tf` file hidden away from prying eyes for extra security and to help reduce manual input in your `main.tf` file.*

3. User Data breakdown:
   1. `set -e` to stop the script if any commands fail. 
   2. Update and upgrade our packages.
   3. Install required utlities such as `wget` and `grp`, and then adds the official `Grafana APT repoistory` for package management.
   4. Refresh the APT cache and installs Grafana packages.
   5. Start and enable Grafana, ensuring it starts automatically on boot.
   6. Echo a message to indicate Grafana is successfully installed and running on port `3000` (May take 5-10 minutes to load the page).

```
  user_data = <<-EOT
                #!/bin/bash
                # 1. Exit on error
                set -e

                # 2. Update and upgrade system packages
                sudo apt-get update -y
                sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

                # 3. Add Grafana APT repository
                echo "Adding Grafana repository..."
                sudo apt-get install -y software-properties-common wget gpg
                wget -q -O - https://packages.grafana.com/gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/grafana-archive-keyring.gpg
                echo "deb [signed-by=/usr/share/keyrings/grafana-archive-keyring.gpg] https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

                # 4. Update repositories and install Grafana
                sudo apt-get update -y
                sudo apt-get install -y grafana

                # 5. Start and enable Grafana
                sudo systemctl start grafana-server
                sudo systemctl enable grafana-server

                # 6. Confirmation of start up
                echo "Grafana is installed and running on port 3000."
                  EOT
```

4. We add a tag, as it allow you to attach metadata to AWS resources in key-value pairs.

```
  tags = {
    Name = "pre-assignment-kagan-tf-app-grafana"
  }
}
```

### Creating the Grafana Instance Security Group Resource
5. Now we need to set up the security group for the instance in order for the instance to know what ports traffic can come in and out of. We create a resource block with the following variables:
   - Name: The name that the NSG will have when it's created.
   - Description: A brief description for clarity.

```
resource "aws_security_group" "pre-assignment-kagan-tf-nsg-grafana" {
  name        = "pre-assignment-kagan-tf-nsg-grafana"
  description = "Security group allowing SSH, port 3000"
```

*Note! You will see that we have the "name" there twice. Once in the resource block declaration, the other on the inside. The first one can be changed to anything, i.e `pre-assignment-nsg-graf`, which would then be used as reference in other resource blocks if necessary. I've chosen to have the names be the same for simplicity.*

6. We need to create some ingress and egress blocks to determine which traffic is allowed in and out.

```
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
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.public_cidr_block
  }
}
```

### Creating the Prometheus Instance Resource (Second EC2 Instance)
7. You probably get the point now, so I won't re-explain this part...

```
resource "aws_instance" "prometheus_instance" {
  ami                         = var.app_ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.my_super_duper_secret_key
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-nsg-prometheus.id]
```

8. ... However! The user data has changed since we're installed Prometheus on a new machine:
   1. `set -e` to exit on error again.
   2. Update and upgrade packages.
   3. Install Prometheus and the Node Exporter.
   4. Start both of them up and enable them so they start on boot.
   5. Echo a confirmation message.

```
  user_data = <<-EOT
                #!/bin/bash
                # Exit on error
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

                # Confirmation message
                echo "Prometheus and Node Exporter are running."
                  EOT
```

9. Once again we We add a tag.

```
  tags = {
    Name = "pre-assignment-kagan-tf-app-prometheus"
  }
}
```

### Creating the Prometheus Instance Security Group Resource
10. Shocker. We're here again. Making yet another security group. Start with the resource block.

```
resource "aws_security_group" "pre-assignment-kagan-tf-nsg-prometheus" {
  name        = "pre-assignment-kagan-tf-nsg-prometheus"
  description = "Security group allowing SSH, port 3000"
```

11. Insideo of that, we set up our ingress and egress blocks again. This time, we allow `22` as well as `9090` and `9100`, as Prometheus and Node Exporter operate on these ports, respectively.

```
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
```

### Creating Outputs For Our URLs

12.  Now that we've finished the main bulk of our terraform file, we can work on an ease-of-access feature. URLs!!! Woohoo! Pretty self explainatory, but it's gonna output some URLs into the console once `terraform apply` is complete, reducing the the need to use the AWS as much.

```
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
```

## Bonus Section: Provisioning Prometheus as a Data Source on Grafana
13. So you're feeling a little extra huh. You wanna take it to the next level of laziness. Trust me, so did I. Here's how you do it.
    1. Configure grafana provisioning directory by creating a folder for `datasources` and changes ownership of the `/etc/grafana` directory and its subdirectories to the grafana user and group.
    2. Add Prometheus data source provisioning file by creating a `YAML` file with all this lovely stuff: 
        - `apiVersion: 1`: Specifies the version of the provisioning configuration file.
        - `datasources`: A list of data sources to provision for Grafana.
        - `name`: Prometheus: Sets the name of the data source as "Prometheus".
        - `type`: prometheus: Specifies the type of data source as Prometheus.
        - `access: proxy`: Configures Grafana to access Prometheus via the Grafana server (proxy mode).
        - `url`: http://${aws_instance.prometheus_instance.public_ip}:9090: Defines the URL of the Prometheus server, dynamically injected with the public IP of the Prometheus instance.
        - `isDefault`: true: Marks Prometheus as the default data source for Grafana.
        - `jsonData.timeInterval`: 5s: Sets the default time interval for queries to 5 seconds.

```
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
```

If you want to see it put together, head over to [my main.tf file](tf-files/main.tf). Ok. That's it. Go away now.