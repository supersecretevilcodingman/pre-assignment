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
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-app-nsg.id]

  user_data = templatefile("../provisioning/app-provision.sh",
    {
      # GH_REPO_URL = var.github_repo_url,
      DB_PRIV_IP   = aws_instance.db_instance.private_ip
      GH_PAT_TOKEN = var.github_pat_token
    }
  )

  tags = {
    Name = "pre-assignment-kagan-tf-app"
  }

  depends_on = [
    aws_instance.db_instance
  ]
}

# App Security Group

resource "aws_security_group" "pre-assignment-kagan-tf-app-nsg" {
  name        = "pre-assignment-kagan-tf-app-nsg"
  description = "Security group allowing SSH, port 3000"

  ingress {
    description = "Allow SSH from localhost"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  ingress {
    description = "Allow 5000"
    from_port   = 5000
    to_port     = 5000
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

# DB Instance

resource "aws_instance" "db_instance" {
  ami                         = var.app_ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.my_super_duper_secret_key
  vpc_security_group_ids      = [aws_security_group.pre-assignment-kagan-tf-db-nsg.id]

  user_data = templatefile("../provisioning/db-provision.sh",
    {
      DATABASE_SEED_SQL = file("../provisioning/library.sql")
    }
  )

  tags = {
    Name = "pre-assignment-kagan-tf-db"
  }
}

# DB Security Group

resource "aws_security_group" "pre-assignment-kagan-tf-db-nsg" {
  name        = "pre-assignment-kagan-tf-db-nsg"
  description = "Security group allowing SSH, port 3306"

  ingress {
    description = "Allow SSH from localhost"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_cidr_block
  }

  ingress {
    description = "Allow MySQL port"
    from_port   = 3306
    to_port     = 3306
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
  value       = "App Page: http://${aws_instance.app_instance.public_ip}:5000/web/authors"
}