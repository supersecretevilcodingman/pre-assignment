#!/bin/bash
set -e  # Exit on error

# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install MySQL Server
echo "Installing MySQL Server..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y

# Start MySQL 
echo "Starting MySQL..."
sudo systemctl start mysql

# Allow remote connections
echo "[INFO] Configuring MySQL to allow remote connections..."
sudo sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Create MySQL user and granting privileges for the library database...
echo "Creating MySQL user and granting privileges for the library database..."
sudo mysql -ppassword -e "CREATE USER 'app_user'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON library.* TO 'app_user'@'%'; FLUSH PRIVILEGES;"

# Generate SQL file from variable DATABASE_SEED_SQL, replacing it with the contents of the library.sql file
echo "Creating SQL library seed file..."
sudo tee ./library.sql <<EOF
${DATABASE_SEED_SQL}
EOF

# Execute the SQL commands stored in library.sql
echo "Populating database with seed data from './library.sql'..."
sudo mysql -ppassword -e "SOURCE ./library.sql"

# Restart MySQL to apply the changes made
echo "Restarting MySQL to apply changes..."
sudo systemctl restart mysql

