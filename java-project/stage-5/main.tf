# AWS Provider
provider "aws" {
  region = "eu-west-1"
}

# App Instance

resource "aws_instance" "app_instance" {
  ami                         = var.app_ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.my_super_duper_secret_key
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-kuberentes-app-nsg.id]

  user_data = templatefile("./kubernetes-provisioning/app-prov-deployment.sh",
    {
      APP_DEPLOYMENT_YAML             = file("./kubernetes-provisioning/app-deployment.yaml"),
      APP_SERVICE_YAML                = file("./kubernetes-provisioning/app-service.yaml"),
      DB_CONFIGMAP_YAML               = file("./kubernetes-provisioning/db-configmap.yaml"),
      DB_DEPLOYMENT_YAML              = file("./kubernetes-provisioning/db-deployment.yaml"),
      DB_PERSISTENT_VOLUME_YAML       = file("./kubernetes-provisioning/db-pers-volume.yaml"),
      DB_PERSISTENT_VOLUME_CLAIM_YAML = file("./kubernetes-provisioning/db-pers-volume-claim.yaml"),
      DB_SERVICE_YAML                 = file("./kubernetes-provisioning/db-service.yaml"),
      DATABASE_SEED_SQL               = file("./kubernetes-provisioning/library.sql")
    }
  )

  tags = {
    Name = "pre-assignment-kagan-tf-kuberentes-app"
  }
}

# App Security Group

resource "aws_security_group" "pre-assignment-kagan-tf-kuberentes-app-nsg" {
  name        = "pre-assignment-kagan-tf-kuberentes-app-nsg"
  description = "Security group allowing SSH, port HTTP"

  ingress {
    description = "Allow SSH from localhost"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
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

output "app_page" {
  description = "URL to App Page"
  value       = "App Page: http://${aws_instance.app_instance.public_ip}/web/authors"
}