- [Pre-Requisits](#pre-requisits)
  - [JDK Installation](#jdk-installation)
  - [Maven Installation](#maven-installation)
  - [MySQL Installation](#mysql-installation)
- [For Stage 1: Private GitHub repo for the storage of the app code and SQL script to seed the database. You will need this to do your `git clone` from.](#for-stage-1-private-github-repo-for-the-storage-of-the-app-code-and-sql-script-to-seed-the-database-you-will-need-this-to-do-your-git-clone-from)
- [For Stage 2: Deploy the app locally on your machine.](#for-stage-2-deploy-the-app-locally-on-your-machine)
  - [Login to our MySQL and prepare it for use:](#login-to-our-mysql-and-prepare-it-for-use)
  - [Setting up the MySQL database:](#setting-up-the-mysql-database)
  - [Get the app running using Maven:](#get-the-app-running-using-maven)
- [For Stage 3: Bash provision scripts for app and database VMs that runs in user data](#for-stage-3-bash-provision-scripts-for-app-and-database-vms-that-runs-in-user-data)
  - [Creating VM for the app and DB](#creating-vm-for-the-app-and-db)
    - [The app VM](#the-app-vm)
      - [Provisioning Script](#provisioning-script)
    - [The DM VM](#the-dm-vm)
      - [Provisioning Script](#provisioning-script-1)
    - [Blockers](#blockers)
- [For Stage 4: Bash provision script for a single VM that runs in user data but deploys the app and database using containers on the one machine. The containers run by the script should use Docker images](#for-stage-4-bash-provision-script-for-a-single-vm-that-runs-in-user-data-but-deploys-the-app-and-database-using-containers-on-the-one-machine-the-containers-run-by-the-script-should-use-docker-images)
- [For Stage 5: Bash provision script for a single VM that runs in user data, but provisions and deploys the app and database using Kubernetes (and optionally Helm) on the one machine](#for-stage-5-bash-provision-script-for-a-single-vm-that-runs-in-user-data-but-provisions-and-deploys-the-app-and-database-using-kubernetes-and-optionally-helm-on-the-one-machine)


# Pre-Requisits

## JDK Installation
1. We'll start by download JDK. [Click here](https://www.oracle.com/java/technologies/downloads/#java17-windows) to download it.
- Move it your `C:\my-cmd-line-tools` directory.
- You will need to set a system variable called `JAVA_HOME` so that it knows to use Java as the language and which version.

## Maven Installation
1. Next we need to prepare the machine to use Maven by installing it. [Click here](https://maven.apache.org/download.cgi) to access the Maven download page and download the required version for your system. For this project, I downloaded `apache-maven-3.9.9-bin.zip`. Once downloaded:
- Extract it to your `C:\my-cmd-line-tools` directory.

## MySQL Installation
1. We will also need MySQL installed as it serves as the data storage layer for this application. [Click here](https://dev.mysql.com/downloads/installer/) to access the MySQL download page and download the required version for your system. For this project, I downloaded `Windows (x86, 32-bit), MSI Installer (mysql-installer-community-8.0.40.0.msi`.
- Download  this to your `C:\my-cmd-line-tools` directory. 
- **Potential blocker!* The PATH variable may be incorrect. To remedy this, do the following:
  1. Righ click `This PC` and select `Properties`.
  2. Search for `Edit the system environment variables` and select it.
  3. When the new window opens, select `environment variables`. 
  4. Another new window will open. Select your `Path` variable and click `Edit`. 
  5. Another new window (I know.) will open. Click `Edit` for `mySQL` path and change it to the path of your command line tools directory.
  6. Restart your GitBash window and you should now be able to check that you've fixed it using `mysql --version`.
- When you download it, you'll come across a screen to add a user. Insert the values that you will use for your `DB_USER` and `DB_PASS` variables. *This applies to ALL THREE of the tools we've just downloaded. You may need to go add their paths to the PATH variable.*

# For Stage 1: Private GitHub repo for the storage of the app code and SQL script to seed the database. You will need this to do your `git clone` from. 
Create a private GitHub repo.

# For Stage 2: Deploy the app locally on your machine.

Firstly, we need to set the environment variables required for local deployment:

```
export DB_HOST=jdbc:mysql://localhost:3306/library >> ~/.bashrc
export DB_USER=<your-database-username> >> ~/.bashrc
export DB_PASS=<your-database-password> >> ~/.bashrc
```

Setting these with `>> ~/.bashrc` will make the variables persistent. We then use `source ~/.bashrc` to reload and apply the changes made the the `.bashrc` file in the current shell session.

## Login to our MySQL and prepare it for use:
   1. Open your GitBash terminal and insert `net start` to check if mySQL is running. If it is nnot visible in this list, use `net start mySQL`. Similarly, if you wish to stop it, you can use `net stop mySQL`. *Note! You may need to run powershell as admin in order to stop this process.*
   2. Open your PowerShell terminal and log into mySQL using `mysql -u root -p`. This will prompt you to insert the password you previously created. Now we will be able to create.

## Setting up the MySQL database:
   1. Insert `CREATE DATABASE library_db;` into the shell. 
   2. Source the `library.sql` file with `SOURCE <route to file>/library.sql;`
   3. Verify the source using `SHOW TABLES;`. This should a library table, which contains two more tables: `authors` and `books`.
   4. Using `SELECT * FROM authors;` should then view the data within the `authors` table, while `SELECT * FROM books;` should return an empty set.

## Get the app running using Maven:
   1. `cd` into the `LirbaryProject2` directory on a GitBash terminal and use `mvn clean install` to build the project. We will get an error, but this does not currently apply to local deployment. 
   2. Use `mvn spring-boot:run` to start the application. This will hang the terminal, but the page will be accessible.
   3. This is what should be viewable on `http://localhost:5000/web/authors`:

![alt text](image-1.png)

The MySQL databsae has correctly connected to the application, completing your local deployment of the application. Testing of the edit functions further demonstrate success, as they will update the MySQL table.

![alt text](image-2.png)

We can also view an author by individual ID by accessing the URL `http://localhost:5000/web/author/<ID>`:

![alt text](image-3.png)

Now, we can move onto stage 3.

# For Stage 3: Bash provision scripts for app and database VMs that runs in user data 

I used Terraform to set up my VMs, the Terraform file can be found [here](../tf-files/main.tf). I used a GitHub PAT Token in order to access the private repository from the VM.

## Creating VM for the app and DB

### The app VM
1. Create the VM using `Ubuntu 22.04` and a `t3.micro`. 
2. For the NSG, Allow `SSH` for testing and a `custom TCP port 5000` connections since that is Spring Boots default IP. Once a reverse proxy is set up, you won't need this port to be exposed in the NSG.  

#### Provisioning Script

```
#!/bin/bash
set -e  # Exit on error
REPO_URL="https://supersecretevilcodingman:${GH_PAT_TOKEN}@github.com/supersecretevilcodingman/library-java17-mysql-app"
```
- **Explanation**: Enables the script to terminate if any command fails. Defines the GitHub repository URL with an embedded Personal Access Token (PAT) for authentication.
- **Purpose**: Ensures robust error handling and securely references the repository.

```
# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
```
- **Explanation**: Updates the system's package lists and upgrades all installed packages to their latest versions.
- **Purpose**: Ensures the system is up-to-date with security patches and compatible libraries.

```
# Install Java 17
echo "Installing Java 17..."
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y
```
- **Explanation**: Installs OpenJDK 17 without requiring user interaction during the installation process.
- **Purpose**: Provides the Java environment necessary for the application to run.

```
# Set JAVA_HOME variable and update the path
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
echo "JAVA_HOME is: $JAVA_HOME"
echo "PATH is: $PATH"
```
- **Explanation**: Defines the JAVA_HOME environment variable and updates the system's PATH to include Java binaries.
- **Purpose**: Ensures Java is correctly configured and accessible.

```
# Download and install Apache Maven, extract all Maven binaries and configuration files to opt directory and move it to different directory
echo "Downloading and installing Apache Maven..."
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.9.9-bin.tar.gz -C /opt
sudo mv /opt/apache-maven-* /opt/maven
```
- **Explanation**: Downloads the Maven binary archive, extracts it to /opt, and renames the directory for consistency.
- **Purpose**: Installs Maven, a build tool required for the project.

```
# Export Maven environment variables
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH
echo "M2_HOME is: $M2_HOME"
echo "PATH is: $PATH"
```
- **Explanation**: Sets the M2_HOME variable and updates the PATH to include Maven binaries.
- **Purpose**: Configures Maven for use in the environment.

```
# Cleanup the Maven tarball
echo "Cleaning up the Maven tarball..."
rm apache-maven-*.tar.gz
```
- **Explanation**: Deletes the downloaded Maven archive file to free up space.
- **Purpose**: Maintains a clean system environment by removing unnecessary files.

```
# Export environment variables
export DB_HOST=jdbc:mysql://${DB_PRIV_IP}:3306/library
export DB_USER="app_user"
export DB_PASS="password"
```
- **Explanation**: Sets environment variables for database connection details, including host, user, and password.
- **Purpose**: Passes necessary database credentials to the application for runtime use.

```
# Check to variables were set correctly...
echo "DB_HOST is: $DB_HOST"
echo "DB_USER is: $DB_USER"
echo "DB_PASS is: $DB_PASS"
```
- **Explanation**: Prints the values of the exported variables to verify they were set correctly.
- **Purpose**: Debugging step to ensure the environment is correctly configured.

```
# Clone Repository
echo "Cloning the repository..."
git clone "$REPO_URL" repo
```
- **Explanation**: Clones the specified GitHub repository into a directory named repo.
- **Purpose**: Retrieves the project source code.

```
# CD into project repo
cd repo/LibraryProject2
```
- **Explanation**: Changes the working directory to the cloned repository's project folder.
- **Purpose**: Prepares the environment for building and running the application.

```
# Waiting for DB to initialise...
sleep 10s
```
- **Explanation**: Pauses script execution for 10 seconds.
- **Purpose**: Gives the database time to finish starting up and be ready for connections.

```
# Build the package using Maven
echo "Building the project using Maven..."
mvn clean package -DskipTests
```
- **Explanation**: Runs Maven to clean any previous builds and package the application, skipping tests.
- **Purpose**: Prepares the application for deployment.

```
# Start the Spring Boot application
echo "Starting the Spring Boot application..."
mvn spring-boot:start
```
- **Explanation**: Uses Maven to start the Spring Boot application.
- **Purpose**: Launches the application for use.


### The DM VM
1. Create the VM using `Ubuntu 22.04` and a `t3.micro`. 
2. Create the VM on AWS, allowing `SSH` for testing and a `custom TCP port 3306`, with the App VM's NSG selected as the source for security.

#### Provisioning Script

```
#!/bin/bash
set -e  # Exit on error
```
- **Explanation**: Ensures the script terminates if any command fails.
- **Purpose**: Enables robust error handling to prevent cascading failures.

```
# Update and upgrade system packages
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
```
- **Explanation**: Updates the system's package lists and upgrades all installed packages.
- **Purpose**: Ensures the system is up-to-date and avoids compatibility issues.

```
# Install MySQL Server
echo "Installing MySQL Server..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y
```
- **Explanation**: Installs the MySQL database server without user prompts.
- **Purpose**: Sets up MySQL to host the application database.

```
# Start MySQL 
echo "Starting MySQL..."
sudo systemctl start mysql
```
- **Explanation**: Starts the MySQL service.
- **Purpose**: Ensures MySQL is running and ready to accept connections.


```
# Allow remote connections
echo "[INFO] Configuring MySQL to allow remote connections..."
sudo sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
```
- **Explanation**: Updates MySQL configuration to listen on all network interfaces and restarts the service to apply changes.
- **Purpose**: Enables remote access to the database.

```
# Create MySQL user and granting privileges for the library database...
echo "Creating MySQL user and granting privileges for the library database..."
sudo mysql -ppassword -e "CREATE USER 'app_user'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON library.* TO 'app_user'@'%'; FLUSH PRIVILEGES;"
```
- **Explanation**: Creates a new MySQL user with full privileges on the library database and applies changes immediately.
- **Purpose**: Prepares the database for use by the application with a dedicated user.

```
# Generate SQL file from variable DATABASE_SEED_SQL, replacing it with the contents of the library.sql file
echo "Creating SQL library seed file..."
sudo tee ./library.sql <<EOF
${DATABASE_SEED_SQL}
EOF
```
- **Explanation**: Writes the value of the DATABASE_SEED_SQL variable to a file named library.sql.
**Purpose**: Creates the seed file to populate the database with initial data.

```
# Execute the SQL commands stored in library.sql
echo "Populating database with seed data from './library.sql'..."
sudo mysql -ppassword -e "SOURCE ./library.sql"
```
- **Explanation**: Executes the SQL commands in library.sql to populate the database.
- **Purpose**: Sets up initial data for the application to function.

```
# Restart MySQL to apply the changes made
echo "Restarting MySQL to apply changes..."
sudo systemctl restart mysql
```
- **Explanation**: Restarts the MySQL service.
- **Purpose**: Ensures all configuration and privilege changes are fully applied.

### Blockers
Throughout the provisioning phase, I had multiple blockers that stopped me from progressing from a large period of time:

**Script Writing**: We had only written a couple scripts while in training, so this task was something we needed practice with. I applied logic for the script creation, originally mapping out exactly what was needed. After testing in a local environment, I knew what I needed to download.

**Understanding what happens to env variables and the cloned repo upon script completion**: I realised that the environment variables I was setting would not persist once the script was completed running. This originally had me thinking that they weren't being set at all. To troubleshoot this, I added some `echo` testing logs to see it when I used `cat /var/log/cloud-init-output.log`. This helped me to clarify that the variables were being set during runtime. This also helped me figure out that the `repo` was being cloned despite it not appearing on the virtual machine, which had stuck for quite some time.

**Build test errors stopping the app from booting**: Which then begged the question, what actually was the reason my application wasn't starting? It seemed that the `AuthorRepository bean` test was failing, which meant depends on the database being ready and populated with data, meaning the application would not run. This was hard to understand, as the database VM had finished running and populated before the app VM. Manual checks showed that the script should work, as inputting each line in would give the desired end result. To fix the issue with the script, I added a `-DskipTests` to the `mvn clean package` line, that skipped the tests that seemed to stop the app from running. 

# For Stage 4: Bash provision script for a single VM that runs in user data but deploys the app and database using containers on the one machine. The containers run by the script should use Docker images 
- already uploaded to Docker Hub. 
- Docker-related files 
- Dockerfile files 
- Docker-compose YAML file 
- Dockerised application images built and ready for deployment 


# For Stage 5: Bash provision script for a single VM that runs in user data, but provisions and deploys the app and database using Kubernetes (and optionally Helm) on the one machine 
- Kubernetes-related files 
- YAML definition/configuration files 
- (Optional) Helm chart and values YAML files

