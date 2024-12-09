#!/bin/bash

echo "Update and upgrade packages..." 
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Docker Setup
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add Ubuntu user to docker group and restart docker to apply the changes IF it has not been added already
echo Checking if ubuntu user has been added...
if ! groups ubuntu | grep -q '\bdocker\b'; then
    echo "Adding ubuntu to the docker group..."
    sudo usermod -aG docker ubuntu
    exec sg docker "$0"
    exit
fi

# Minikube Setup
echo "Downloading minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

echo "Installing minikube..."
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

echo "Setting Docker as the driver..."
minikube config set driver docker

# Make a directory for the application files
mkdir /home/ubuntu/library-app
cd /home/ubuntu/library-app

# Generate SQL file from variable DATABASE_SEED_SQL, replacing it with the contents of the library.sql file
echo "Creating SQL library seed file..."
sudo tee ./library.sql <<EOF
${DATABASE_SEED_SQL}
EOF

# Create app-deployment.yaml
echo "Creating app-deployment.yaml file..."
sudo tee ./app-deployment.yaml <<EOF
${APP_DEPLOYMENT_YAML}
EOF

# Create app-service.yaml
echo "Creating app-service.yaml file..."
sudo tee ./app-service.yaml <<EOF
${APP_SERVICE_YAML}
EOF

# Create db-configmap.yaml
echo "Creating db-configmap.yaml file..."
sudo tee ./db-configmap.yaml <<EOF
${DB_CONFIGMAP_YAML}
EOF

# Create db-deployment.yaml
echo "Creating db-deployment.yaml file..."
sudo tee ./db-deployment.yaml <<EOF
${DB_DEPLOYMENT_YAML}
EOF

# Create db-pers-volume-claim.yaml
echo "Creating db-pers-volume-claim.yaml file..."
sudo tee ./db-pers-volume-claim.yaml <<EOF
${DB_PERSISTENT_VOLUME_CLAIM_YAML}
EOF

# Create db-pers-volume.yaml
echo "Creating db-pers-volume.yaml file..."
sudo tee ./db-pers-volume.yaml <<EOF
${DB_PERSISTENT_VOLUME_YAML}
EOF

# Create db-service.yaml
echo "Creating db-service.yaml file..."
sudo tee ./db-service.yaml <<EOF
${DB_SERVICE_YAML}
EOF

# Use Ubuntu user
sudo -u ubuntu -i bash <<'EOF'

# Start minikube
minikube start
MINIKUBE_IP=$(minikube ip)

# Set up Nginx
sudo apt-get install nginx -y
sudo sed -i "s|try_files \$uri \$uri/ =404;|proxy_pass http://$MINIKUBE_IP:30001;|" /etc/nginx/sites-available/default
sudo systemctl restart nginx

echo "Applying Kubernetes resources..."

cd /home/ubuntu/library-app

minikube kubectl -- apply -f app-deployment.yaml
minikube kubectl -- apply -f app-service.yaml
minikube kubectl -- apply -f db-configmap.yaml
minikube kubectl -- apply -f db-deployment.yaml
minikube kubectl -- apply -f db-pers-volume-claim.yaml
minikube kubectl -- apply -f db-pers-volume.yaml
minikube kubectl -- apply -f db-service.yaml

minikube kubectl -- get all
EOF