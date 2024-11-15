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
- [Section 5: Monitoring and Alerting for AWS EBS](#section-5-monitoring-and-alerting-for-aws-ebs)
  - [AWS EBS Monitoring and Alerting](#aws-ebs-monitoring-and-alerting)
    - [Overview of EBS](#overview-of-ebs)
    - [EBS Volume Types](#ebs-volume-types)
    - [Performance Metrics](#performance-metrics)
    - [Key Concepts for GP2 Volumes](#key-concepts-for-gp2-volumes)
    - [Use Cases](#use-cases-1)
    - [Monitoring EBS](#monitoring-ebs)
    - [Summary](#summary)
- [Section 6: Monitoring and Alerting for AWS RDS](#section-6-monitoring-and-alerting-for-aws-rds)
  - [AWS EBS Monitoring and Alerting](#aws-ebs-monitoring-and-alerting-1)
    - [Overview of EBS](#overview-of-ebs-1)
    - [EBS Volume Types](#ebs-volume-types-1)
    - [Performance Metrics](#performance-metrics-1)
    - [Key Concepts for GP2 Volumes](#key-concepts-for-gp2-volumes-1)
    - [Use Cases](#use-cases-2)
    - [Monitoring EBS](#monitoring-ebs-1)
    - [Summary](#summary-1)

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

N/A.

# Section 5: Monitoring and Alerting for AWS EBS

## AWS EBS Monitoring and Alerting

### Overview of EBS
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

## AWS EBS Monitoring and Alerting

### Overview of EBS
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

