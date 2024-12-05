#!/bin/bash
set -e  # Exit on error

# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install docker and docker compose, grant execute permissions, then enable it
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y docker.io docker-compose -y
sudo systemctl enable docker

# Make a directory for the application files
mkdir /home/ubuntu/library-app
cd /home/ubuntu/library-app

# Generate SQL file from variable DATABASE_SEED_SQL, replacing it with the contents of the library.sql file
echo "Creating SQL library seed file..."
sudo tee ./library.sql <<EOF
${DATABASE_SEED_SQL}
EOF

# Generate docker-compose.yaml file and insert contents from the docker-compose.yaml file referenced in variables
echo "Creating SQL library seed file..."
sudo tee ./docker-compose.yaml <<EOF
${DOCKER_COMPOSE_YAML}
EOF

# Add user to docker group
sudo usermod -aG docker ubuntu

# Switch to ubuntu user, then docker compose the app
sudo -u ubuntu -i bash <<'EOF'
cd /home/ubuntu/library-app
docker-compose down -v
docker-compose up -d
EOF