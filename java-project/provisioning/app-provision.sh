#!/bin/bash
set -e  # Exit on error
REPO_URL="https://supersecretevilcodingman:${GH_PAT_TOKEN}@github.com/supersecretevilcodingman/library-java17-mysql-app"

# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Java 17
echo "Installing Java 17..."
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y

# Set JAVA_HOME variable and update the path
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
echo "JAVA_HOME is: $JAVA_HOME"
echo "PATH is: $PATH"

# Download and install Apache Maven, extract all Maven binaries and configuration files to opt directory and move it to different directory
echo "Downloading and installing Apache Maven..."
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.9.9-bin.tar.gz -C /opt
sudo mv /opt/apache-maven-* /opt/maven

# Export Maven environment variables
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH
echo "M2_HOME is: $M2_HOME"
echo "PATH is: $PATH"

# Check maven version to ensure installation
mvn -version

# Cleanup the Maven tarball
echo "Cleaning up the Maven tarball..."
rm apache-maven-*.tar.gz

# Export environment variables
export DB_HOST=jdbc:mysql://${DB_PRIV_IP}:3306/library
export DB_USER="app_user"
export DB_PASS="password"

# Check to variables were set correctly...
echo "DB_HOST is: $DB_HOST"
echo "DB_USER is: $DB_USER"
echo "DB_PASS is: $DB_PASS"

# Clone Repository
echo "Cloning the repository..."
git clone "$REPO_URL" repo

# Moving library.sql file to resources directory...
# mv repo/library.sql repo/LibraryProject2/src/main/resources

# CD into project repo
cd repo/LibraryProject2

# Waiting for DB to initialise...
sleep 10s

# Build the package using Maven
echo "Building the project using Maven..."
mvn clean package -DskipTests

# Start the Spring Boot application
echo "Starting the Spring Boot application..."
mvn spring-boot:start