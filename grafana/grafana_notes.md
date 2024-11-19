- [Section 1: Introduction to Grafana: What Is Is and Why You Need It](#section-1-introduction-to-grafana-what-is-is-and-why-you-need-it)
  - [Overview of Grafana](#overview-of-grafana)
    - [What is Grafana?](#what-is-grafana)
  - [Grafana Deployment Options](#grafana-deployment-options)
    - [Available Modes](#available-modes)
  - [Why Grafana?](#why-grafana)
  - [Integration with Prometheus](#integration-with-prometheus)
  - [Use Cases and Data Sources](#use-cases-and-data-sources)
    - [Supported Data Sources](#supported-data-sources)
    - [Use Cases](#use-cases)
  - [Training Modules Overview](#training-modules-overview)
    - [Key Topics](#key-topics)
- [Section 2: Getting started with Grafana and Prometheus](#section-2-getting-started-with-grafana-and-prometheus)
  - [Create an EC2 Instance with Grafana Installed](#create-an-ec2-instance-with-grafana-installed)
    - [Setting up the EC2 instance](#setting-up-the-ec2-instance)
    - [Install Docker](#install-docker)
    - [Pull and run the Grafana Docker Image](#pull-and-run-the-grafana-docker-image)
    - [Go to the Grafana UI](#go-to-the-grafana-ui)
  - [Create an EC2 Instance with Prometheus Installed](#create-an-ec2-instance-with-prometheus-installed)
    - [Setting up the EC2 instance](#setting-up-the-ec2-instance-1)
    - [Install Prometheus and Prometheus Node Exporter and Configure the YAML file](#install-prometheus-and-prometheus-node-exporter-and-configure-the-yaml-file)
    - [Start, enable and access the Prometheus UI](#start-enable-and-access-the-prometheus-ui)
  - [Back on Grafana: Adding a data source](#back-on-grafana-adding-a-data-source)
  - [Grafana OSS Setup as a Service on AWS, User and Access Provisioning.](#grafana-oss-setup-as-a-service-on-aws-user-and-access-provisioning)
    - [Hardware Requirements for Grafana](#hardware-requirements-for-grafana)
    - [Grafana Database](#grafana-database)
  - [Implementation Steps](#implementation-steps)
- [Section 3: Production Readiness Scenarios](#section-3-production-readiness-scenarios)
  - [Install Grafana as a Standalone Binary](#install-grafana-as-a-standalone-binary)
    - [Make sure Grafana binary is available](#make-sure-grafana-binary-is-available)
    - [Extract and Start Grafana](#extract-and-start-grafana)
    - [Check for Grafana Server Utility](#check-for-grafana-server-utility)
    - [Create a Service for Grafana](#create-a-service-for-grafana)
    - [Service File Content](#service-file-content)
      - [How to Navigate Controls Using 'vi' (vim)](#how-to-navigate-controls-using-vi-vim)
    - [Enable and Start Grafana Service](#enable-and-start-grafana-service)
    - [Access Grafana](#access-grafana)
    - [User Congifuration](#user-congifuration)
  - [Configuration Steps](#configuration-steps)
    - [Initial Setup](#initial-setup)
    - [Important Notes](#important-notes)
    - [Teams and Organisations](#teams-and-organisations)
    - [Practical Usage](#practical-usage)
- [Section 4: Workspaces, Cloud Integration, and User Administration](#section-4-workspaces-cloud-integration-and-user-administration)
  - [Workspaces](#workspaces)
  - [Cloud Integration (AWS CloudWatch Example)](#cloud-integration-aws-cloudwatch-example)
  - [User Administration](#user-administration)
  - [Key Takeaways](#key-takeaways)
  - [Steps to Integrate CloudWatch and Grafana for AWS Monitoring](#steps-to-integrate-cloudwatch-and-grafana-for-aws-monitoring)
    - [1. Setting Up IAM in AWS](#1-setting-up-iam-in-aws)
    - [2. Configuring Grafana](#2-configuring-grafana)
    - [3. Fetching Metrics from CloudWatch](#3-fetching-metrics-from-cloudwatch)
    - [4. Creating Dashboards in Grafana](#4-creating-dashboards-in-grafana)
    - [5. Managing Permissions in Grafana](#5-managing-permissions-in-grafana)
    - [6. Advanced Features](#6-advanced-features)
    - [7. Key Notes](#7-key-notes)
- [Section 5: Prometheus setup as a service \& getting started with grafana SMTP relay configuration](#section-5-prometheus-setup-as-a-service--getting-started-with-grafana-smtp-relay-configuration)
  - [Steps to Set Up Prometheus](#steps-to-set-up-prometheus)
  - [Grafana Setup](#grafana-setup)
  - [Summary](#summary)

# Section 1: Introduction to Grafana: What Is Is and Why You Need It

## Overview of Grafana
### What is Grafana?
- An **open-source visualization tool** for monitoring and observability.
- **Core Functionality**: Offers advanced visualization for backend data sources.
- **Adoption**: Popular in organizations like Intel, Apple, and PayPal for infrastructure and application monitoring.
- **Key Use Cases**: Infrastructure monitoring, application health tracking, and supporting observability frameworks.

---

## Grafana Deployment Options
### Available Modes
1. **Grafana Open Source (OS)**:
   - Community-supported.
   - Free to use with no Service-Level Agreement (SLA).
   - Vulnerability management depends on community contributions.
2. **Grafana Enterprise**:
   - Paid solution with enterprise-level support and SLAs.
   - Offers enhanced features and integration plugins.
3. **Grafana SaaS (Managed by Grafana Labs)**:
   - Fully managed solution with backend handled by Grafana Labs.
   - Suitable for organizations needing reduced infrastructure management.

---

## Why Grafana?
- Offers **enriched visualization** compared to Prometheus or other monitoring tools.
- Supports various types of graphs: Time series, gauge, tables, and more.
- Easily integrates with **Prometheus**, **InfluxDB**, **CloudWatch**, and other data sources.
- Provides **template variables** for creating dynamic, reusable dashboards.

---

## Integration with Prometheus
- Prometheus acts as a **time-series database** backend for Grafana.
- **Data Collection**:
  - Prometheus uses exporters to scrape metrics from sources like infrastructure (Node Exporter) and applications.
  - Stores data in its time-series database.
- Grafana visualizes the collected metrics via Prometheus.

---

## Use Cases and Data Sources
### Supported Data Sources
- Prometheus (default for training sessions).
- InfluxDB, CloudWatch, SQL Server (to be covered in specific scenarios).
- Future exploration: Kubernetes monitoring, Telegraf integrations.

### Use Cases
- Infrastructure monitoring (CPU, memory, disk utilization).
- Application performance monitoring (API metrics, logs).
- Real-time security alerts visualization with time-series formatted data.

---

## Training Modules Overview
### Key Topics
1. **Dashboarding**:
   - Creating and customizing dashboards.
   - Best practices for effective data representation.
2. **Installation**:
   - Dockerized deployment of Grafana.
   - Setting up Grafana on AWS EC2 instances.
3. **Data Source Management**:
   - Adding and managing data sources in Grafana.
   - Connecting Grafana to Prometheus and other supported backends.
4. **Advanced Features**:
   - Alerts and notifications.
   - User and workspace management.
   - LDAP integration for user authentication.
5. **Plugins and Customization**:
   - Extending functionality with plugins.
   - Annotation for improved insight.
6. **Performance Optimization**:
   - Fine-tuning Grafana for scalability and efficiency.

# Section 2: Getting started with Grafana and Prometheus

## Create an EC2 Instance with Grafana Installed

### Setting up the EC2 instance
1. Set up an EC2 instance using Ubuntu. Ensure the security group allows `SSH` and port `3000`.
2. `sudo apt-get update` and `sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y`.

### Install Docker
1. Install Docker: `sudo apt-get install docker.io -y`
2. Start Docker Service: `sudo systemctl start docker`
3. Check docker status: `sudo systemctl status docker`
4. Enable Docker to Start at Boot: `sudo systemctl enable docker`
 
### Pull and run the Grafana Docker Image
1. Pull the Latest Grafana Image: `sudo docker pull grafana/grafana`
2. Run the Container: `sudo docker run -d -p 3000:3000 --name=grafana grafana/grafana`

### Go to the Grafana UI
1. Use the EC2 public IP with the port `3000` to access the Grafana UI. The default login details are:
   - **username**: `admin` 
   - **password**: `admin`

## Create an EC2 Instance with Prometheus Installed

### Setting up the EC2 instance
1. Set up an EC2 instance using Ubuntu. Ensure the security group allows `SSH`, `HTTP` and port `9090` (Prometheus uses this port).
2. `sudo apt-get update` and `sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y`.

### Install Prometheus and Prometheus Node Exporter and Configure the YAML file
1. Insert the following command: `sudo apt-get install prometheus prometheus-node-exporter -y`.
2. Edit the Prometheus config file: `sudo nano /etc/prometheus/prometheus.yml`
3. Add or modify the scrape targets IF necessary: 

```yaml
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
```

### Start, enable and access the Prometheus UI
1. Start Prometheus using: `sudo systemctl start prometheus`.
2. Enable it using: `sudo systemctl enable prometheus`.
3. Access it using your EC2's public IP with a port of `9090`.

## Back on Grafana: Adding a data source
1. Select `Data sources` under `Connections`:

![alt text](images/datasources.png)

2. Select `Add data source` (it's a big blue button so I will NOT be giving you a screenshot).
3. Select `Prometheus`. You may need to search for it.

![alt text](images/prometheus.png)

4. Once selected, name it whatever you like and then edit the connection to use the Public IP of your EC2 instance with Prometheus installed on it:

![alt text](images/connection.png)

5. Select `Save & test`. It should prompt you to begin building a dashboard. If you select `Data sources` again, you'll now see `Prometheus` there.

## Grafana OSS Setup as a Service on AWS, User and Access Provisioning.

### Hardware Requirements for Grafana
* The CPU should handle both **user management** and **data processing**.
  * The number of users, dashboards, and alerts can impact CPU requirements.
* **Minimum Hardware Requirements**: Grafana requires a minimum of **512 MB RAM** and one CPU or VCPU.
 
### Grafana Database
* **Native Database**: Grafana uses **SQLite** by default to store configurations, user data, data sources, alerts, dashboards, and team/workspace information.
* **Supported Databases**: Grafana also supports MySQL, PostgreSQL, and other relational databases.
 
## Implementation Steps
* **Using Grafana Binaries**: Utilise Grafana binaries for installation.
  * For this training course, Grafana version 9.3.15 is used.
* **Version Selection**: Organisations often use the N-1 stable version to avoid immediate bugs.
  * The latest version is 10.4, but 9.3.15 is chosen for stability.


# Section 3: Production Readiness Scenarios 

## Install Grafana as a Standalone Binary
Source: https://grafana.com/grafana/download
 
* Version: 9.3.15
* Edition: Enterprise.
 
### Make sure Grafana binary is available
* SSH into instance: 'georgia-grafana-aws-test-2'
* Switch to root user: `sudo su -`
* Create a directory for Grafana: `mkdir /opt/grafana`
* Navigate to the directory: `cd /opy/frafana`
* Download the Grafana binary:
 
```bash
`wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.3.15.linux-amd64.tar.gz`
```

### Extract and Start Grafana
 
* Now we have Grafana binary available.
* Extract the downloaded binary:
  * `tar -xvzf grafana-enterprise-9.3.15.linux-amd64.tar.gz`
* List the contents to verify: `ls -al`

### Check for Grafana Server Utility
 
* Check if it has a Grafana Server utility:
  * Navigate to the Grafana directory: `cd grafana-9.3.15/`
  * List the contents: `ls`
 
* Navigate to the bin directory: `cd bin`
* ist the contents to ensure the server utility is present: `ls`
 
### Create a Service for Grafana
* Open the systemd directory: `cd /etc/systemd/system`
* Create and edit the service file: `vi grafana-server.service`
 
### Service File Content
Add the following content to the service file:
 
```bash
[Unit]
Description=Grafana
Documentation=http://docs.grafana.org
Wants=network-online.target
After=netwrok-online.target
 
[Service]
User=root
type=simple
WorkingDirectory=/opt/grafana/grafana-9.3.15
ExecStart=/opt/grafana/grafana-9.3.15/bin/grafana-server web
 
[Install]
WantedBy=multi-user.target
```

#### How to Navigate Controls Using 'vi' (vim)
* Enter Insert Mode: `i` to make changes.
* Exit Insert Mode: Press `Esc`.
* Save and Exit: Type `:wq` and press `Enter`.
 
### Enable and Start Grafana Service
* Reload Systemd Daemon: `systemctl daemon-reload`
* Enable Grafana Service: `systemctl enable grafana-server.service`
* Start the service: `systemctl start grafana-server.service`
* Check status: `systemctl status grafana-server.service`
 
Enable Sigv4 authentication through built in AWS-SDK in Grafana
* `systemctl daemon-reload`
* `AWS_SDK_LOAD_CONFIG=true`
* `GF_AUTH_SIGV4_AUTH_ENABLED=true`
 
> Use this if you are coming into an error.
 
### Access Grafana
You should now be able to access Grafana.
* Take the public IP from your instance.
  * "georgia-grafana-aws-test-2" in my case.
* And add `:3000` onto the end in a web browser.
* To login: admin, admin.
  * Then choose a password if you'd like or click "skip".
 
### User Congifuration
* In the bottom left corner of Grafana, click on "Configuration" > "Teams".
* This is where you can add users/ group multiple users.
 
## Configuration Steps
### Initial Setup
`Start Grafana`
* Verify Grafana is running by ensuring port 3000 is accessible.
* Check security group configurations if it does not start.
 
`User Configuration`
* Default user: admin (has server admin permissions).
* Additional users may have limited permissions unless explicitly elevated.
* User permissions are role-based and configurable (e.g., Admin, Editor, Viewer).
 
`SMTP Configuration`
* SMTP is required for sending emails (e.g., notifications or invitations).
* Edit the grafana.ini file to include SMTP server details.
  * Example use case: Email notifications for alerts.
 
### Important Notes
* Grafana's features like multi-tenancy and user management require proper backend configurations.
* SMTP setup ensures email-based alerts work.
* Always verify permissions to ensure secure and proper access.
 
### Teams and Organisations
`Teams`
* Used to group multiple users for collaborative dashboards and alerts.
  * Example: A "Performance Engineering" team can have all relevant testers.
 
`Organisations`
* Separate Grafana workspaces for different teams or divisions.
  * Example: A company like HCL can have one organisation for BPO and another for Software Development.
* Managed via Server Admin Permissions.
 
### Practical Usage
`Grafana on Windows`
* Simpler installation process compared to Linux.
* Ideal for monitoring in Windows-based environments.
 
`Integrations`
* Tools like Kibana or CloudWatch can be integrated for enhanced functionality.
* CloudWatch integration will be covered in the next session.

# Section 4: Workspaces, Cloud Integration, and User Administration

## Workspaces
- **Definition**: Workspaces in Grafana are equivalent to **folders** that store dashboards, alerts, and related configurations.
- **Purpose**:
  - Organize dashboards based on teams, projects, or purposes.
  - Segregate data for better access control.
- **Management**:
  - Create new workspaces for specific teams or applications.
  - Assign permissions to workspaces to restrict or grant access.
  - Example:
    - Workspace: `Performance Engineering`
    - Contains dashboards for monitoring performance metrics.
- **Permissions**:
  - **Viewer**: Can view dashboards but cannot edit or create them.
  - **Editor**: Can create and edit dashboards but cannot configure system-wide settings.
  - **Admin**: Full control, including user and workspace management.
- **Workspace Governance**:
  - Use `Manage Permissions` to control access to specific workspaces.
  - Remove permissions for users who should not have visibility into certain workspaces.

---

## Cloud Integration (AWS CloudWatch Example)
- **Purpose**:
  - Integrate Grafana with cloud services like **AWS CloudWatch** for monitoring infrastructure metrics.
  - Leverage Grafana’s visualization capabilities to analyze cloud-native metrics.
- **Integration Steps**:
  1. **Create IAM Role and Policy**:
     - IAM role defines permissions for accessing specific metrics (e.g., EC2, S3).
     - Example permissions for CloudWatch:
       - `GetMetricData`
       - `ListMetrics`
     - Apply `read-only` permissions to prevent unintended changes.
  2. **Create Access Keys**:
     - Programmatic access credentials are used by Grafana to query metrics.
  3. **Configure Grafana**:
     - Add CloudWatch as a **data source** in Grafana.
     - Use access keys or IAM role-based authentication for secure integration.
  4. **Test Integration**:
     - Query metrics (e.g., `CPUUtilization`) from the CloudWatch namespace to verify connectivity.
  5. **Create Dashboards**:
     - Visualize metrics like CPU usage, memory, or storage across services (e.g., EC2, S3).
- **Key Concepts**:
  - **Namespaces**: Represent AWS services (e.g., `EC2`, `S3`).
  - **Query Builder**: Used to filter and visualize specific metrics from CloudWatch.
  - **Alerting**: Alerts can be set up based on metric thresholds (e.g., if CPU utilization exceeds 80%).

---

## User Administration
- **User Roles**:
  - **Viewer**:
    - Default role with read-only access.
    - Can view dashboards but cannot modify or create them.
  - **Editor**:
    - Can create, edit, and delete dashboards within their assigned scope.
    - Cannot manage system-wide configurations or users.
  - **Admin**:
    - Full access, including user management, plugin installation, and permissions.
    - Can create, delete, or modify teams and workspaces.
- **Managing Users**:
  - Invite users via email to join Grafana.
  - Assign specific roles (Viewer, Editor, or Admin) based on responsibilities.
- **Teams**:
  - **Definition**: Groups of users within Grafana, created to organize and manage access.
  - **Use Case**:
    - Assign team-level permissions for specific workspaces or dashboards.
    - Example Teams:
      - `Performance Engineering`
      - `Application Engineering`
  - **Permissions**:
    - Each team can have its own set of access rights (view, edit, admin) for specific workspaces or dashboards.
- **Server Admin**:
  - A superuser role with the ability to manage the entire Grafana server.
  - Includes advanced capabilities such as:
    - Organization settings.
    - Licensing.
    - System-wide statistics.

---

## Key Takeaways
- Workspaces help organize dashboards and manage access in a scalable way.
- Cloud integration like AWS CloudWatch allows advanced monitoring and visualization.
- User administration ensures proper access control and team-based segregation of data.

---

## Steps to Integrate CloudWatch and Grafana for AWS Monitoring

### 1. Setting Up IAM in AWS
1. **Create a Policy:**
   - Navigate to the AWS IAM service.
   - Create a policy with read-only access for the EC2 service.
   - Ensure the following actions are allowed:
     - `cloudwatch:GetMetricData`
     - `cloudwatch:ListMetrics`
     - `cloudwatch:GetMetricStatistics`
   - Attach this policy to the user or role.

2. **Create a Role:**
   - Go to the IAM service and create a new role for programmatic access.
   - Attach the created policy to this role.
   - Generate and securely store the **Access Key** and **Secret Key** for programmatic access.

---

### 2. Configuring Grafana
1. **Access Grafana:**
   1. Log in to Grafana.
   2. Go to the **Configuration** -> **Data Sources** section.

2. **Add a CloudWatch Data Source:**
   1. Select **CloudWatch** as the data source.
   2. Provide the following details:
     - **Access Key:** Use the key from the created IAM role.
     - **Secret Key:** Use the secret key from the created IAM role.
     - **Region:** Select the appropriate AWS region.
   3. Test the connection to ensure Grafana can fetch data from CloudWatch.

---

### 3. Fetching Metrics from CloudWatch
1. **Choose Namespace:**
   - Select a namespace corresponding to the AWS service you want to monitor, such as:
     - `AWS/EC2` for EC2 metrics.
     - `AWS/S3` for S3 bucket metrics.

2. **Select Metrics:**
   - Filter and choose metrics like `CPUUtilization`, `DiskReadOps`, or `BucketCount` depending on the namespace.

3. **Filter by Dimensions:**
   - Use dimensions like `InstanceId` for EC2 instances to refine your data.

4. **Test Queries:**
   - Run queries to ensure that data is successfully retrieved from CloudWatch.

---

### 4. Creating Dashboards in Grafana
1. **Create a Dashboard:**
   - Go to **Dashboard** -> **New Dashboard** -> **Add a Panel**.

2. **Select Data Source:**
   - Choose the configured **CloudWatch** data source.

3. **Configure Panels:**
   - Add panels to visualize metrics such as `CPU Utilization` or `Bucket Count`.
   - Customize panels with labels, graphs, or stat views.

4. **Save the Dashboard:**
   - Name the dashboard appropriately and save it.

---

### 5. Managing Permissions in Grafana
1. **Create Workspaces:**
   - Use workspaces (folders) in Grafana to segregate dashboards by teams or projects.

2. **Set Permissions:**
   - Assign permissions to users or groups:
     - **Viewer:** Read-only access.
     - **Editor:** Modify dashboards but no administrative capabilities.
     - **Admin:** Full administrative access.

---

### 6. Advanced Features
1. **Alerts:**
   - Set up alerts for specific metrics, such as high CPU utilization or low bucket count.
   - Configure notification channels like email or Slack.

2. **Template Variables:**
   - Use template variables to dynamically filter and display metrics across multiple instances or services.

3. **Collaboration:**
   - Enable team-specific dashboards by managing users in separate Grafana workspaces.

---

### 7. Key Notes
- **CloudWatch Role:** Ensure the IAM role is limited to the required read-only permissions for security.
- **Performance:** Monitor the number of concurrent Grafana users, as high concurrency may impact performance.
- **Scalability:** For production environments, consider using Grafana Cloud or a high-capacity instance.

# Section 5: Prometheus setup as a service & getting started with grafana SMTP relay configuration 

## Steps to Set Up Prometheus

1. **Create Required Directories:**
   - Create directories for Prometheus under `/etc` and `/var/lib`.
     ```bash
     mkdir -p /etc/prometheus /var/lib/prometheus
     ```

2. **Download and Extract Prometheus:**
   - Use `wget` to download Prometheus binaries.
     ```bash
     wget https://github.com/prometheus/prometheus/releases/download/<version>/prometheus-<version>.tar.gz
     tar -xvzf prometheus-<version>.tar.gz
     ```

3. **Move Binaries to Appropriate Directories:**
   - Copy Prometheus binaries and libraries:
     ```bash
     cp prometheus /usr/local/bin/
     cp promtool /usr/local/bin/
     cp -r consoles /etc/prometheus/
     cp -r console_libraries /etc/prometheus/
     ```

4. **Configure Prometheus:**
   - Modify the `prometheus.yml` configuration file under `/etc/prometheus/`.
     ```yaml
     global:
       scrape_interval: 10s

     scrape_configs:
       - job_name: "prometheus"
         static_configs:
           - targets: ["localhost:9090"]
     ```

5. **Create a Systemd Service for Prometheus:**
   - Add the following service file at `/etc/systemd/system/prometheus.service`:
     ```ini
     [Unit]
     Description=Prometheus Monitoring Service
     After=network.target

     [Service]
     User=root
     ExecStart=/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus
     Restart=always

     [Install]
     WantedBy=multi-user.target
     ```

6. **Start and Enable Prometheus Service:**
   ```bash
   systemctl daemon-reload
   systemctl start prometheus
   systemctl enable prometheus
   ```

7. **Access Prometheus UI:**
   - Open `http://<instance-ip>:9090` in your browser.

## Grafana Setup

1. **Add Prometheus as a Data Source in Grafana:**
   - Navigate to the Grafana UI and add Prometheus as a data source with the URL `http://<Prometheus-IP>:9090`.

2. **Create Dashboards and Panels:**
   - Use the Prometheus data source to create visualizations.

3. **Configure SMTP Relay for Alerts:**
   - Update `grafana.ini` for SMTP settings.
     ```ini
     [smtp]
     enabled = true
     host = smtp.example.com:587
     user = your-email@example.com
     password = your-password
     from_address = grafana@example.com
     from_name = Grafana
     ```

   - Restart Grafana service.
     ```bash
     systemctl restart grafana-server
     ```

4. **Set Up Alerts in Grafana:**
   - Create alert rules and assign notifications to email or other channels like PagerDuty.

## Summary

- Prometheus collects metrics, scrapes data from targets, and provides basic UI at port `9090`.
- Grafana integrates with Prometheus for visualization and alerting.
- Alerts can be configured in Grafana to trigger notifications based on specified thresholds.

