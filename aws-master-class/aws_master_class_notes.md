- [Section 1: Introduction to AWS](#section-1-introduction-to-aws)
  - [Benefits of AWS Cloud](#benefits-of-aws-cloud)
    - [Cloud Service Models](#cloud-service-models)
      - [Infrastructure as a Service (IaaS)](#infrastructure-as-a-service-iaas)
      - [Platform as a Service (PaaS)](#platform-as-a-service-paas)
      - [Software as a Service (SaaS)](#software-as-a-service-saas)
    - [Why Companies Are Adopting Cloud Computing and AWS](#why-companies-are-adopting-cloud-computing-and-aws)
      - [Benefits of Cloud Computing](#benefits-of-cloud-computing)
    - [AWS-Specific Advantages](#aws-specific-advantages)
    - [Traditional IT vs. Cloud Computing](#traditional-it-vs-cloud-computing)
  - [Services Provided by AWS](#services-provided-by-aws)
    - [Startups Using AWS](#startups-using-aws)
    - [Large Enterprises Using AWS](#large-enterprises-using-aws)
      - [How Enterprises Use AWS](#how-enterprises-use-aws)
      - [Hybrid Cloud Deployments](#hybrid-cloud-deployments)
      - [Migration and Transformation](#migration-and-transformation)
    - [Why AWS is Trusted by Leading Companies](#why-aws-is-trusted-by-leading-companies)
- [Section 2: Understanding Monitoring and Alerting Services in AWS](#section-2-understanding-monitoring-and-alerting-services-in-aws)
  - [AWS CloudWatch Overview](#aws-cloudwatch-overview)
    - [What is CloudWatch?](#what-is-cloudwatch)
    - [Key Features and Benefits](#key-features-and-benefits)
  - [AWS SNS Overview](#aws-sns-overview)
    - [What is SNS?](#what-is-sns)
    - [Key Features](#key-features)
    - [Example Workflow](#example-workflow)
    - [Benefits](#benefits)
- [Section 3: Deep Dive into AWS CloudWatch](#section-3-deep-dive-into-aws-cloudwatch)
  - [Key Features](#key-features-1)
  - [Use Cases](#use-cases)
- [Section 4: Monitoring and Alerting for AWS EC2](#section-4-monitoring-and-alerting-for-aws-ec2)
  - [Overview of EC2](#overview-of-ec2)
    - [Key Monitoring Features](#key-monitoring-features)
    - [Benefits of EC2 Monitoring](#benefits-of-ec2-monitoring)
    - [Example Use Case](#example-use-case)
- [Section 5: Monitoring and Alerting for AWS EBS](#section-5-monitoring-and-alerting-for-aws-ebs)
  - [Overview of EBS](#overview-of-ebs)
    - [EBS Volume Types](#ebs-volume-types)
    - [Performance Metrics](#performance-metrics)
    - [Key Concepts for GP2 Volumes](#key-concepts-for-gp2-volumes)
    - [Use Cases](#use-cases-1)
    - [Monitoring EBS](#monitoring-ebs)
    - [Summary](#summary)
- [Section 6: Monitoring and Alerting for AWS RDS](#section-6-monitoring-and-alerting-for-aws-rds)
  - [Overview of RDS](#overview-of-rds)
    - [Importance of Monitoring RDS](#importance-of-monitoring-rds)
    - [Monitoring Features](#monitoring-features)
    - [Benefits](#benefits-1)
    - [Use Case Example](#use-case-example)
- [Section 7: Monitoring and Alerting for AWS ELB](#section-7-monitoring-and-alerting-for-aws-elb)
  - [Overview of ELB](#overview-of-elb)
    - [Importance of ELB Monitoring](#importance-of-elb-monitoring)
    - [Key Metrics to Monitor](#key-metrics-to-monitor)
    - [Monitoring Procedures](#monitoring-procedures)
    - [Benefits of Monitoring ELB](#benefits-of-monitoring-elb)
- [Section 8: Monitoring and Alerting for AWS Billing and Costs](#section-8-monitoring-and-alerting-for-aws-billing-and-costs)
  - [Overview](#overview)
    - [Importance of Monitoring Billing](#importance-of-monitoring-billing)
    - [Key Metrics for Billing](#key-metrics-for-billing)
    - [Monitoring Features](#monitoring-features-1)
    - [Best Practices](#best-practices)
    - [Benefits](#benefits-2)
- [Takeaways](#takeaways)
  - [EC2 (Elastic Compute Cloud)](#ec2-elastic-compute-cloud)
  - [EBS (Elastic Block Store)](#ebs-elastic-block-store)
  - [RDS (Relational Database Service)](#rds-relational-database-service)
  - [ELB (Elastic Load Balancer)](#elb-elastic-load-balancer)

# Section 1: Introduction to AWS

## Benefits of AWS Cloud

### Cloud Service Models

#### Infrastructure as a Service (IaaS)
- Most basic cloud service model.
- Cloud provider offers:
  - Computers (physical or virtual machines).
  - Other resources (e.g., storage, networking).
- Abstracts user from infrastructure details:
  - Physical computing, resource location, data partitioning, scaling, security, backup, etc.

#### Platform as a Service (PaaS)
- Offers a development environment for application developers.
- Cloud provider provides:
  - Toolkits and standards for development.
  - Channels for distribution and payment.
- Includes:
  - Operating systems, programming environments, databases, and web servers.
- Examples: Beanstalk, Azure Websites, etc.

#### Software as a Service (SaaS)
- Provides access to application software and databases.
- Cloud provider manages infrastructure and platform.
- Often priced as:
  - Pay-per-user basis or subscription fee.
- Examples: Google Apps, Microsoft Office 365, etc.

---

### Why Companies Are Adopting Cloud Computing and AWS

#### Benefits of Cloud Computing
1. **Agility**:
   - Applications can be deployed faster.
   - Improved manageability and reduced maintenance.
2. **Scalability & Elasticity**:
   - Resources can be scaled up or down based on business needs.
   - Adapts to growth trajectories, seasonality, and usage patterns.

### AWS-Specific Advantages
1. **Security**:
   - Provides a secure environment meeting strict information security requirements.
   - Trusted by global corporations and governments.
   - Compliant with security and governance standards.
   - Offers robust controls, auditing, and certifications.

2. **Flexibility**:
   - Hybrid cloud capabilities extend on-premises infrastructure to the cloud.
   - Optimizes resource usage and eliminates unnecessary liabilities.

3. **Cost Efficiency**:
   - Converts CapEx to OpEx.
   - Pay only for the selected services.
   - Reduces total cost of ownership (TCO).
   - AWS optimizes operations and passes savings to clients.

4. **On-Demand Capacity**:
   - Allows measurement of required compute capacity.
   - Provides just-in-time resources to handle peak loads.
   - Enables seamless scaling without effort or delays.

5. **Innovation**:
   - Encourages experimentation, development, and exploration.
   - Minimizes risk and fosters a culture of innovation.

### Traditional IT vs. Cloud Computing
- Traditional IT:
  - Long setup times for private infrastructure.
  - Requires purchasing expensive equipment that is often underutilized.
  - Fixed costs and capacity guessing lead to inefficiencies.
- Cloud Computing:
  - Deploys resources within minutes.
  - Optimized usage with no unused capacity.
  - Reduces costs and provides flexibility.

---

AWS is a preferred choice due to its ability to:
- Offer cost savings.
- Ensure security and compliance.
- Provide scalability for businesses of all sizes.
- Drive innovation while reducing risks.

## Services Provided by AWS

### Startups Using AWS
- Popular startups employing AWS services:
  - Instagram
  - LinkedIn
  - Dropbox
  - Tumblr
  - Airbnb

### Large Enterprises Using AWS
- AWS is not just for startups but also leading enterprises like:
  - Unilever
  - Lamborghini
  - Tata Motors

#### How Enterprises Use AWS
1. **Development and Testing**:
   - Companies like Lionsgate, Tokyo Stock Exchange, and Galera Chemicals use AWS for these purposes.
   - AWS provides infrastructure and application services such as:
     - Database services
     - Queuing services
     - Workflow services
   - Benefits:
     - Faster development cycles.
     - Reduced operational costs.
     - Quicker time to market.

2. **Innovation and Solution Deployment**:
   - Companies like Expedia, General Electric, and PBS deploy innovative solutions on AWS Cloud.
   - Netflix runs its entire video streaming business on AWS.

3. **Mobile Service Management**:
   - Companies like Samsung and Vodafone use AWS to enhance their mobile services and app stores.
   - HTC employs AWS for mobile-focused websites.

4. **Traditional Websites and Digital Transformation**:
   - Enterprises like Unilever and Lamborghini use AWS for:
     - Website hosting.
     - Digital transformation initiatives.

5. **Data Analytics**:
   - Companies like Pfizer and Aon build and deploy data analytics solutions using AWS tools.

6. **Mobile Revolution**:
   - AWS supports development, deployment, and testing of mobile applications.
   - Examples: HTC, Vodafone.

#### Hybrid Cloud Deployments
- Some companies adopt hybrid cloud environments due to:
  - Legacy applications.
  - Data security, privacy, and regulatory compliance issues.
- Examples:
  - Nasdaq, SunPower, and Nokia use AWS to extend their private data centres for:
    - Data analytics.
    - Integration.
    - Operational applications.

- Samsung integrates AWS with its on-premises infrastructure for:
  - Financial transactions.
  - Elastic scaling of critical business areas.

#### Migration and Transformation
- Enterprises migrating applications to the cloud:
  - Unilever and Bristol-Myers use AWS for faster, cost-effective product creation and simulations.
  - NewsCorp migrated its entire data centre to AWS, reducing traditional data centres from 40 to 6.
  - Netflix and Suncorp run their entire businesses on AWS, eliminating the need for data centres.

---

### Why AWS is Trusted by Leading Companies
- Robust and scalable services.
- Supports a wide range of use cases from startups to large enterprises.
- Encourages innovation and operational efficiency.
- Trusted by household names across industries.

AWS is a feature-rich cloud provider that continues to grow and shape the future of cloud computing.

# Section 2: Understanding Monitoring and Alerting Services in AWS

## AWS CloudWatch Overview

### What is CloudWatch?
- **CloudWatch** is a monitoring service for AWS resources.
- It provides the ability to:
  - Collect and track metrics from various AWS resources.
  - Collect and monitor log files from:
    - AWS services.
    - Custom applications running within AWS infrastructure.

### Key Features and Benefits
1. **Centralised Monitoring**:
   - Combines inbuilt metrics, custom metrics, and logs.
   - Acts as a one-stop shop for all monitoring needs.
   - Provides a single source of diagnostic information for operations teams.

2. **Operational Efficiency**:
   - Eliminates the need to:
     - Search for files across multiple locations.
     - Write scripts to aggregate logs.
     - Use multiple utilities to gather information from services and applications.
   - The CloudWatch console provides all necessary monitoring data in one place.

3. **Alarm Creation**:
   - Allows creation of alarms on any tracked metrics.
   - Alarms can trigger:
     - Notifications via SMS or email.
     - Automated actions.

4. **Automated Actions**:
   - Automated actions triggered by alarms can:
     - Execute custom scripts.
     - Call APIs or custom code.
   - Proactively address critical situations, reducing response time.
   - Free up the operations team to:
     - Collect detailed information.
     - Make informed, reactive decisions.


## AWS SNS Overview

### What is SNS?
- Fully managed **push notification service**.
- Sends messages to mobile devices, email recipients, or distributed services.
- Supports SMS, SQS, Lambda functions, HTTP endpoints, etc.
- Pub/Sub model: Messages sent to a topic are delivered to all subscribed endpoints.

### Key Features
1. **Flexibility**:
   - Supports various protocols (email, SMS, HTTP/HTTPS, SQS, Lambda, etc.).
   - Enables seamless integration with other AWS services like CloudWatch.

2. **Automation**:
   - Triggers actions via API calls, scripts, or Lambda functions.
   - Automates scaling, updates, or task execution.

3. **Alerting and Monitoring**:
   - Integrates with CloudWatch for creating alarms and sending notifications.
   - Simplifies monitoring and alerting workflows.

4. **Subscription Confirmation**:
   - Subscriptions require confirmation to prevent spam.

### Example Workflow
1. Create a topic (e.g., "my-alerting-admins").
2. Add a subscription:
   - Select a protocol (e.g., email).
   - Confirm subscription via email.
3. Create a CloudWatch alarm:
   - Set metric and threshold.
   - Link to SNS topic for notifications.
4. Receive alerts via the subscribed endpoint.

### Benefits
- Centralised messaging for IT infrastructure.
- Reduces complexity and manual effort for alerts and actions.
- Scalable and well-suited for dynamic environments.

# Section 3: Deep Dive into AWS CloudWatch

## Key Features
1. **Metric Monitoring**:
   - Tracks metrics for AWS services (e.g., EC2, S3, RDS).
   - Custom metrics for applications (microservices, web/mobile apps).
2. **Alarms**:
   - States: OK, Alarm, Insufficient Data.
   - Trigger notifications (via SNS) or automated actions (e.g., scaling EC2 instances).
   - Monitors sustained state changes, not momentary thresholds.
3. **Log Aggregation**:
   - Collects, consolidates, and analyses logs from various sources.
4. **Dashboards**:
   - Visualise multiple metrics on a single screen.
   - Pull data from multiple AWS regions for a global view.

## Use Cases
1. **AWS Service Monitoring**:
   - Monitors EC2, RDS, S3, Load Balancers, and more without extra configuration.
2. **Application Monitoring**:
   - Ensures optimal performance for custom apps.
3. **Real-Time Alerts**:
   - Notifies operations teams and triggers automated corrective actions.
   - Example: Auto-scaling EC2 instances during high CPU utilisation.
4. **Integration**:
   - Works with:
     - **SNS**: Notifications via email, SMS, HTTP/HTTPS.
     - **SQS**: Message queues for processing.
     - **Lambda**: Trigger custom actions.
     - **Autoscaling**: Adjust resources based on metrics.

# Section 4: Monitoring and Alerting for AWS EC2

## Overview of EC2
- **EC2 (Elastic Compute Cloud)**: A scalable compute service that allows deployment of virtual servers with various OS options for diverse applications.
- One of AWS's key IaaS offerings, providing raw compute power for flexible usage.

### Key Monitoring Features
1. **Default Metrics**:
   - Includes CPU utilisation, disk I/O, and instance health.
   - Collected every 5 minutes (1-minute intervals available at extra cost).

2. **CloudWatch Integration**:
   - Tracks default and custom metrics.
   - Visualise metrics on dashboards.
   - Enables alarms and automated actions for issues (e.g., rebooting or terminating instances).

3. **Custom Metrics**:
   - Allows monitoring of specific application-level metrics.
   - Integrated with CloudWatch alarms for tailored monitoring.

4. **System Status Checks**:
   - **Instance Status**: Monitors OS-level issues.
   - **System Status**: Tracks underlying hardware and network problems.

### Benefits of EC2 Monitoring
- **Proactive Alerts**:
  - Detect and resolve instance malfunctions automatically.
  - Reduce downtime with automatic recovery or replacement of instances.
- **Cost Optimisation**:
  - Avoid charges for unused or faulty instances by stopping or terminating them promptly.
- **Enhanced Visibility**:
  - Custom metrics provide insights into specific performance parameters.
  - Status checks give a clear indication of instance health.

### Example Use Case
- Scenario: An EC2 instance crashes due to a software failure.
  - **Action**: CloudWatch alarm detects the issue, terminates the faulty instance, and auto-scales to replace it.
  - **Outcome**: Maintains application performance and prevents unnecessary charges.

EC2 monitoring ensures reliability, cost efficiency, and quick resolution of issues within the AWS environment.


# Section 5: Monitoring and Alerting for AWS EBS

## Overview of EBS
- **Elastic Block Storage (EBS)**: Persistent block-level storage for EC2 instances.
- Key Features:
  - Can be attached, detached, and reattached within the same availability zone.
  - Data persists even when detached.
  - Offers high availability and redundancy across AWS regions and availability zones.

### EBS Volume Types
1. **General Purpose SSD (GP2)**:
   - Balances cost and performance.
   - Baseline: 3 IOPs/GB, up to 10,000 IOPs.
   - Burst capacity: Up to 3,000 IOPs.
   - Minimum volume size: 8GB (minimum 100 IOPs allocated).
   - Maximum throughput: 160MB/s.

2. **Provisioned IOPS SSD (io1)**:
   - High-performance, mission-critical workloads.
   - Higher cost than GP2.

3. **Throughput Optimised HDD (st1)**:
   - Sequential workloads requiring high throughput.
   - Lower cost.

4. **Cold HDD (sc1)**:
   - Optimised for infrequent, sequential workloads.
   - Lowest cost.

### Performance Metrics
1. **IOPS (Input/Output Operations per Second)**:
   - Key performance measure.
   - SSD: Measures random operations in 256KB chunks.
   - HDD: Measures sequential operations in 1024KB chunks.
2. **Throughput**:
   - Measured in MB/s, representing the maximum data transfer rate.

### Key Concepts for GP2 Volumes
- Baseline IOPs: 3 IOPs per GB.
- **Burst Credits**:
  - Accumulate during idle periods.
  - Allow performance to exceed baseline temporarily.
  - Initial credit balance: 5.4 million credits (sustains 3,000 IOPs for 30 minutes).
  - Credits are consumed during high activity and replenish when idle.

### Use Cases
1. **Persistent Storage**:
   - Attach to EC2 instances for general-purpose or critical workloads.
2. **High Performance**:
   - Use io1 for applications needing low latency and high throughput.
3. **Sequential Data**:
   - Optimise st1 and sc1 for workloads like backups or logs.

### Monitoring EBS
1. **Metrics to Monitor**:
   - IOPS: Evaluate performance.
   - Throughput: Assess data transfer efficiency.
   - IO Credits: Track burst capacity.
2. **Integration with AWS**:
   - CloudWatch: Monitor performance, set alarms, and trigger actions.
   - SNS: Send alerts or notifications based on CloudWatch alarms.

### Summary
- EBS provides scalable, persistent storage with multiple volume types tailored for different use cases.
- Key performance factors include IOPS, throughput, and burst credits.
- Monitoring EBS through CloudWatch ensures optimal performance and alerting for critical thresholds.

# Section 6: Monitoring and Alerting for AWS RDS

## Overview of RDS
- **Relational Database Service (RDS)**: A PaaS offering from AWS for managing relational databases.
- Supports multiple engines: MySQL, PostgreSQL, SQL Server, Oracle, and Aurora.
- Key features:
  - Scalable and highly available.
  - Automatic failover in case of failures.

### Importance of Monitoring RDS
- Databases are critical for application performance, availability, and user experience.
- Monitoring ensures reliability, performance, and minimal downtime.

### Monitoring Features
1. **CloudWatch Metrics**:
   - Metrics include:
     - **CPU Utilisation**
     - **Database Connections**
     - **Free Memory**
   - Default metrics collected every 5 minutes.

2. **CloudWatch Alarms and Logs**:
   - Alarms based on metric thresholds.
   - Logs available for supported database engines:
     - **MySQL Logs**:
       - Error Log.
       - Slow Query Log.
       - General Log.

3. **Event Notifications**:
   - Tracks changes in DB instances, snapshots, security groups, and parameter groups.
   - Notifications via email, SMS, etc., for configuration changes or actions.

4. **Real-Time Log Monitoring**:
   - View logs that refresh every 5 seconds.
   - Download logs for deeper analysis.

### Benefits
- Proactive issue detection and resolution.
- Real-time insights into database health and performance.
- Enhanced reliability through automated event handling.
- Debugging support with detailed log access and event tracking.

### Use Case Example
- A MySQL database named `Testdb`:
  - Metrics visualised via CloudWatch.
  - Logs monitored in near real-time.
  - Notifications configured for key events or alarms.

By utilising RDS monitoring features, we ensure optimal database performance and minimise downtime.

# Section 7: Monitoring and Alerting for AWS ELB

## Overview of ELB
- **Elastic Load Balancer (ELB)**: AWS's load balancing service.
- Distributes incoming application traffic across multiple EC2 instances.
- Ensures:
  - **Fault Tolerance**: High availability through traffic distribution.
  - **Scalability**: Seamlessly adjusts load balancing capacity as required.

### Importance of ELB Monitoring
- ELBs are the entry points for applications accessed over remote networks.
- Key focus areas:
  - **Availability**: Ensuring the ELB is operational.
  - **Performance**: Routing traffic efficiently to backend resources.

### Key Metrics to Monitor
1. **Request Count**:
   - Total requests handled by the ELB.
   - Identifies traffic patterns and load.

2. **Latency**:
   - Measures the time taken to route traffic from the ELB to the backend instances.
   - High latency indicates performance bottlenecks.

3. **Healthy Host Count**:
   - Number of backend instances passing health checks.
   - Ensures adequate resources to handle traffic.

4. **Unhealthy Host Count**:
   - Instances failing health checks.
   - Indicates backend issues that need resolution.

5. **HTTP Response Codes**:
   - 2xx, 4xx, and 5xx response codes.
   - High 4xx or 5xx errors suggest issues with application or backend resources.

6. **Surge Queue Length**:
   - Number of requests waiting to be routed.
   - A high value indicates the ELB may be overloaded.

7. **Spillover Count**:
   - Number of requests dropped due to queue overflow.
   - Indicates the need for scaling.

### Monitoring Procedures
- Use **AWS CloudWatch** to:
  - Visualise key metrics on dashboards.
  - Set alarms for thresholds (e.g., high latency, unhealthy hosts).
- Configure **Health Checks**:
  - Periodically verify backend instance availability and performance.
- Enable **Access Logs**:
  - Provides detailed request and response data for debugging and optimisation.
- Leverage **Auto Scaling**:
  - Automatically add or remove instances based on traffic patterns to avoid overload.

### Benefits of Monitoring ELB
- Proactively detect and resolve performance or availability issues.
- Ensure seamless traffic distribution for fault tolerance.
- Optimise application performance and user experience.

# Section 8: Monitoring and Alerting for AWS Billing and Costs

## Overview
- AWS operates on a **pay-as-you-go** model:
  - Users pay only for resources used.
  - Costs stop accruing when resources are deallocated.

### Importance of Monitoring Billing
- Prevent unexpected cost overruns due to:
  - Over-provisioning resources.
  - Failure to deallocate unused resources (e.g., EBS volumes after EC2 termination).
  - Lack of knowledge about billing rules for specific services.
- Insight into cloud usage helps optimise resource allocation and minimise costs.

### Key Metrics for Billing
- **Per Resource**: Costs associated with individual resources (e.g., EC2, EBS).
- **Per Resource Type**: Aggregate costs for types of services.
- **Per Region/Availability Zone**: Geographical cost distribution.
- **Thresholds**: Costs exceeding predefined budget limits.

### Monitoring Features
1. **Billing Alerts**:
   - Available only to the **root account**.
   - Alerts can be received via:
     - **Email**: Includes PDF invoices.
     - **CloudWatch Alarms**: Triggered by selected billing metrics.

2. **CloudWatch Billing Metrics**:
   - Must enable **Receive Billing Alerts** in the billing and cost management dashboard.
   - Metrics include total and per-resource spending.

3. **Daily Billing Reports**:
   - Generated and saved to a designated **S3 bucket** for review and analysis.

4. **Insights for Optimisation**:
   - Monitor and analyse spend by resource, resource type, and region.
   - Use insights to adjust resources for cost efficiency.

### Best Practices
- **Set Billing Thresholds**:
  - Configure CloudWatch alarms for expected budget limits.
- **Enable Billing Reports**:
  - Use daily billing reports for detailed cost analysis.
- **Optimise Resources**:
  - Regularly review metrics and deallocate unused resources.
- **Delegate Root Account Oversight**:
  - Ensure only authorised access to billing metrics.

### Benefits
- Proactively prevents cost overruns.
- Provides transparency into resource usage and spending.
- Supports strategic optimisation of cloud operations.

# Takeaways

## EC2 (Elastic Compute Cloud)
**Description**: A scalable compute service that lets you deploy and manage virtual servers to run applications and workloads on demand.  
**Analogy**: EC2 is like renting a car—you get a vehicle (compute power) for as long as you need it and can customise it for your journey (applications).

## EBS (Elastic Block Store)
**Description**: A persistent block storage service designed to store data for use with EC2 instances, supporting high availability and reliability.  
**Analogy**: EBS is like a portable hard drive—you can attach it to your computer (EC2 instance), store data, and reuse it even if you switch devices.

## RDS (Relational Database Service)
**Description**: A fully managed relational database service that automates setup, scaling, and maintenance for supported database engines.  
**Analogy**: RDS is like a managed library system—you borrow books (database storage) without worrying about organising shelves (infrastructure).

## ELB (Elastic Load Balancer)
**Description**: A managed service that distributes incoming traffic across multiple backend targets to ensure availability and scalability.  
**Analogy**: ELB is like a traffic cop at a busy intersection—efficiently directing vehicles (requests) to their destinations to avoid congestion.
