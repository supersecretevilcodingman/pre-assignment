- [What is Cloud Computing?](#what-is-cloud-computing)
    - [Key Features:](#key-features)
    - [Benefits:](#benefits)
  - [Different Types of Cloud Computing](#different-types-of-cloud-computing)
    - [Private Cloud:](#private-cloud)
    - [Public Cloud:](#public-cloud)
    - [Hybrid Cloud:](#hybrid-cloud)
  - [AWS Cloud Overview](#aws-cloud-overview)
    - [Advantages:](#advantages)
    - [Common Use Cases:](#common-use-cases)
- [What is a Database?](#what-is-a-database)
  - [Types of Databases](#types-of-databases)
    - [Relational Databases (SQL):](#relational-databases-sql)
      - [RDS (Relational Database Service)](#rds-relational-database-service)
      - [Aurora](#aurora)
    - [NoSQL Databases:](#nosql-databases)
      - [ElastiCache](#elasticache)
      - [DynamoDB](#dynamodb)
    - [AWS Managed Databases](#aws-managed-databases)
      - [Redshift](#redshift)
      - [Amazon EMR (Elastic MapReduce)](#amazon-emr-elastic-mapreduce)
      - [Athena](#athena)
      - [Amazon QuickSight](#amazon-quicksight)
      - [Amazon DocumentDB](#amazon-documentdb)
      - [Amazon Neptune](#amazon-neptune)
      - [Amazon Timestream](#amazon-timestream)
      - [Amazon QLDB](#amazon-qldb)
      - [Amazon Managed Blockchain](#amazon-managed-blockchain)
      - [Amazon Glue](#amazon-glue)
    - [AWS DMS (Database Migration Service)](#aws-dms-database-migration-service)
- [Other Compute Services](#other-compute-services)
  - [Amazon ECS](#amazon-ecs)
  - [AWS Fargate](#aws-fargate)
  - [Amazon ECR](#amazon-ecr)
  - [Amazon EKS](#amazon-eks)
  - [AWS Lambda](#aws-lambda)
  - [API Gateway](#api-gateway)
  - [AWS Batch](#aws-batch)
  - [Amazon Lightsail](#amazon-lightsail)
- [AWS Deployment and Developer Services](#aws-deployment-and-developer-services)
  - [Deployment Services](#deployment-services)
    - [CloudFormation](#cloudformation)
    - [Elastic Beanstalk](#elastic-beanstalk)
    - [CodeDeploy](#codedeploy)
    - [Systems Manager](#systems-manager)
  - [Developer Services](#developer-services)
    - [CodeCommit](#codecommit)
    - [CodeBuild](#codebuild)
    - [CodeDeploy](#codedeploy-1)
    - [CodePipeline](#codepipeline)
    - [CodeArtifact](#codeartifact)
    - [AWS CDK (Cloud Development Kit)](#aws-cdk-cloud-development-kit)
- [Global Applications in AWS](#global-applications-in-aws)
    - [Route 53 (Global DNS)](#route-53-global-dns)
    - [CloudFront (Global Content Delivery Network)](#cloudfront-global-content-delivery-network)
    - [S3 Transfer Acceleration](#s3-transfer-acceleration)
    - [Global Accelerator](#global-accelerator)
    - [AWS Outposts](#aws-outposts)
    - [WaveLength](#wavelength)
    - [Local Zones](#local-zones)
- [AWS Messaging and Streaming Services](#aws-messaging-and-streaming-services)
    - [SQS (Simple Queue Service)](#sqs-simple-queue-service)
    - [SNS (Simple Notification Service)](#sns-simple-notification-service)
    - [Kinesis](#kinesis)
    - [Amazon MQ](#amazon-mq)
- [Cloud Monitoring Overview](#cloud-monitoring-overview)
    - [What is CloudWatch Metrics?](#what-is-cloudwatch-metrics)
    - [What are CloudWatch Alarms?](#what-are-cloudwatch-alarms)
- [Introduction to VPC (Virtual Private Cloud)](#introduction-to-vpc-virtual-private-cloud)
    - [What is a VPC?](#what-is-a-vpc)
    - [Key Concepts to Know (High-Level Overview)](#key-concepts-to-know-high-level-overview)


# What is Cloud Computing?
On-demand delivery of computing power, storage, and services over the internet.

### Key Features:
- Pay-as-you-go pricing: Pay only for what you use.
- Scalability: Instantly scale resources up or down.
- Ease of Access: Resources accessible globally in seconds.

### Benefits:
- Flexibility, cost-effectiveness, high availability, and elasticity.
No need for hardware maintenance.

## Different Types of Cloud Computing

### Private Cloud:
- Dedicated infrastructure for a single organisation.
- High security and control (e.g., Rackspace).
### Public Cloud:
- Shared infrastructure managed by a third party.
- Examples: AWS, Azure, Google Cloud.
### Hybrid Cloud:
- Combination of private and public clouds.
- Keeps sensitive assets private while using public cloud for flexibility.

## AWS Cloud Overview
Cloud platform offering on-demand services like computing, storage, and databases.

### Advantages:
- Global Infrastructure: Operates worldwide.
- Massive Economies of Scale: Reduced costs due to shared resources.
- Elasticity: Scale resources based on demand.
- Agility: Rapidly develop and deploy applications.

### Common Use Cases:
- Hosting websites, backups, big data processing, disaster recovery.
- Tools: Easy-to-use interfaces and APIs for accessing resources.

# What is a Database?
A structured way to store data for efficient querying and searching. Better for defining relationships between datasets compared to storage options like EBS, EFS, S3.

## Types of Databases
### Relational Databases (SQL):
- Use structured schemas and relations between tables.
- Queried using SQL.
- **Scaling**: Vertical (scale up).
- **Example**: Tables for students, departments linked by IDs.

#### RDS (Relational Database Service)
- Definition: Managed SQL-based relational database service supporting engines like MySQL, PostgreSQL, and Oracle.
- Use Case Example: Run a transactional application (OLTP), like an e-commerce website managing orders and customer data.

#### Aurora
- Definition: AWS-optimised relational database offering high performance and scalability for MySQL and PostgreSQL.
- Use Case Example: Power a high-traffic SaaS application with millions of transactions and low-latency requirements.

### NoSQL Databases:
- Flexible schema, optimised for specific data models. 
- JSON format, supports nested fields and arrays.
- **Types**: Key-value, document, graph, in-memory, search databases.
- **Benefits**: Scalability (horizontal), high performance, flexible structure.

#### ElastiCache
- Definition: Managed in-memory caching service using Redis or Memcached for high-speed, low-latency data retrieval.
- Use Case Example: Cache session data for a web application to reduce database load and improve response time.

#### DynamoDB
- Definition: Fully managed, serverless NoSQL key-value database designed for low-latency and scalability.
- Use Case Example: Store and query user profile data for a mobile app requiring single-digit millisecond latency.

### AWS Managed Databases
**Managed by AWS**:
- Benefits: Quick provisioning, high availability, automated backups, easy scaling, integrated monitoring, and patching.
- Examples: RDS, DynamoDB, ElastiCache, Redshift, etc.

**Self-managed (on EC2)**:
- User handles backups, patching, scaling, fault tolerance.
- Key Advantages of Managed Databases
- Simplifies operations.
- Ensures resiliency, scalability, and fault tolerance.
- Saves time and reduces operational burden.

#### Redshift
- Definition: Managed OLAP data warehouse optimised for analytics, using columnar storage and SQL-based queries.
- Use Case Example: Analyse petabytes of sales data to generate business intelligence dashboards in QuickSight.
- **Redshift Serverless**:
  - **Serverless**: No provisioning or scaling required; AWS handles infrastructure.

#### Amazon EMR (Elastic MapReduce)
- Definition: Managed service for creating Hadoop clusters to process and analyse large-scale data.
- Use Case Example: Process and transform terabytes of raw clickstream data to uncover trends and patterns.

#### Athena
- Definition: Amazon Athena is a serverless query service that enables SQL-based analysis of data directly stored in Amazon S3, without requiring data loading.
- Use Case Example: Analyse AWS CloudTrail logs in S3 to track and report on user activity in an AWS account.

#### Amazon QuickSight
- Definition: Amazon QuickSight is a serverless business intelligence (BI) service that uses machine learning to create interactive dashboards and visualisations from your data.
- Use Case Example: Build a sales performance dashboard by visualising data stored in Amazon Redshift to help business users identify trends and insights.

#### Amazon DocumentDB
- Definition: Amazon DocumentDB is a fully managed NoSQL database compatible with MongoDB, designed for storing, querying, and indexing JSON data.
- Use Case Example: Manage a large-scale application like an IoT platform, storing and querying JSON documents for device configurations and telemetry data.

#### Amazon Neptune
- Definition: Amazon Neptune is a fully managed graph database designed for highly connected datasets, enabling efficient storage and querying of relationships.
- Use Case Example: Power a social network where users interact through likes, comments, shares, and connections.

#### Amazon Timestream
- Definition: Amazon Timestream is a fully managed, serverless time series database designed for storing and analysing time series data, such as data points evolving over time.
- Use Case Example: Monitor IoT sensor data to track temperature and humidity changes over time in a smart home.

#### Amazon QLDB
- Definition: Amazon QLDB (Quantum Ledger Database) is a fully managed, serverless ledger database for recording immutable, cryptographically verifiable changes to data over time.
- Use Case Example: Track financial transactions in a centralised ledger for auditing purposes, ensuring no transaction can be deleted or modified.

#### Amazon Managed Blockchain
- Definition: Amazon Managed Blockchain is a service for creating or joining decentralised blockchain networks using frameworks like Hyperledger Fabric and Ethereum.
- Use Case Example: Build a private supply chain network where multiple parties can securely share data without a central authority.

#### Amazon Glue
- Definition: AWS Glue is a serverless ETL (Extract, Transform, Load) service used to prepare, transform, and load data for analytics.
- Use Case Example: Extract data from S3 and RDS, transform it into a usable format, and load it into Redshift for analytics.

### AWS DMS (Database Migration Service)
AWS DMS is a managed service for migrating databases quickly and securely from a source to a target database with minimal downtime.
- Supports homogeneous migrations (e.g., Oracle to Oracle) and heterogeneous migrations (e.g., SQL Server to Aurora).
- Runs on an EC2 instance that extracts, transforms, and loads data.
- Resilient and self-healing, ensuring a smooth migration.

# Other Compute Services

## Amazon ECS
- Elastic Container Service to run Docker containers on AWS.
- Requires provisioning and managing EC2 instances as the infrastructure for containers.
- AWS handles container placement on EC2 instances and integrates with Application Load Balancers for web applications.

**Key Features**
- Manages containers across EC2 instances.
- User is responsible for creating and managing EC2 infrastructure.
- Automatically places Docker containers on the appropriate EC2 instances.

**Use Case Example**
Running Docker Containers on EC2:
  1. Create EC2 instances as the infrastructure.
  2. Use ECS to deploy and manage Docker containers across these instances.
  3. Integrate with an Application Load Balancer for web traffic.

## AWS Fargate
- Serverless service for running Docker containers without managing infrastructure.
- AWS provisions and manages the compute required for containers automatically.

**Key Features**
- No EC2 instance management: AWS handles the infrastructure.
- Containers run based on specified CPU and RAM configurations.
- Easier to use than ECS; fully serverless.

**Use Case Example**
- Running Docker Containers Without EC2:
  1. Store Docker images in Amazon ECR.
  2. Use Fargate to automatically run containers based on the images without worrying about infrastructure.

## Amazon ECR
- **Elastic Container Registry**: A private Docker registry to store and manage Docker images on AWS.

**Key Features**
- Stores Docker images for use with ECS or Fargate.
- Supports multiple container images and versions.

**Use Case Example**
- Storing Docker Images:
  1. Store application images in Amazon ECR.
  2. ECS or Fargate retrieves images from ECR to run containers.

## Amazon EKS
- Elastic Kubernetes Service is a managed service to deploy and manage Kubernetes clusters on AWS.
- Simplifies the management, deployment, and scaling of containerized applications.

**Key Features**
- Kubernetes Management: AWS manages the control plane and underlying infrastructure.
- Deployment Options:
  - Containers can run on EC2 instances or Fargate for a serverless experience.
- Cloud Agnostic: Kubernetes clusters can run on AWS, Azure, GCP, or on-premises.
- Scales and orchestrates Docker containers or other containerized workloads.

**Use Case Example**
- Deploying a Kubernetes Cluster on AWS:
  1. Use Amazon EKS to create a Kubernetes cluster.
  2. Deploy Docker containers as pods onto EC2 instances (EKS nodes) or Fargate.
  3. EKS manages the scheduling and scaling of the containers.

## AWS Lambda
- Serverless compute service that runs code in response to events.
- Executes on-demand and stops when not needed.
- Automatically scales and eliminates the need to manage servers.

**Key Features**
- Event-Driven: Triggered by AWS services like S3, DynamoDB, or CloudWatch.
- Pay-As-You-Go: Pay per request and compute time (1M requests and 400K GB-seconds free/month).
- Supports Multiple Languages: Node.js, Python, Java, C#, Ruby, and custom runtimes (e.g., Rust, Golang).
- Fully Integrated: Works seamlessly with other AWS services.
- Scalable: Automatically handles millions of requests.

**Use Cases**
- Serverless Thumbnail Service:
  1. S3 triggers Lambda when an image is uploaded.
  2. Lambda resizes the image and stores the thumbnail in S3.
  3. Optionally logs metadata to DynamoDB.
- Serverless CRON Jobs:
  1. Use CloudWatch Events or EventBridge to schedule tasks (e.g., run a script hourly/daily).

## API Gateway
- A serverless service to create, publish, maintain, and secure RESTful and WebSocket APIs.
- Used to expose backend services (e.g., Lambda, DynamoDB) as HTTP APIs to external clients.

**Key Features**
- Serverless and fully managed, scales automatically.
- Supports RESTful APIs and WebSocket APIs for real-time streaming.
- Provides built-in security (authentication, API keys, throttling).
- Includes monitoring capabilities to track API usage.

**Use Case Example**
- Serverless HTTP API:
  1. Client sends a request to API Gateway.
  2. API Gateway proxies the request to a Lambda function.
  3. Lambda processes the request and interacts with DynamoDB.
  4. The result is sent back to the client via API Gateway.

## AWS Batch
- Fully managed batch processing service to run batch jobs at any scale.
- Automatically provisions and scales EC2 or Spot Instances based on workload.
- Handles jobs with a defined start and end (e.g., processing tasks).

**Key Features**
- Dynamically provisions EC2/Spot Instances to match batch queue demands.
- Jobs are defined as Docker images and run on ECS.
- Optimized for cost and scalability with automatic resource management.
- Supports large storage options through EC2 (e.g., EBS, instance store).
- Managed service but not serverless (relies on EC2 instances).

**Use Case Example**
- Batch Image Processing:
  1. Users upload images to an S3 bucket.
  2. AWS Batch triggers a job to process the images (e.g., apply filters).
  3. Processed images are stored in another S3 bucket.

## Amazon Lightsail
- Simplified service offering virtual servers, storage, databases, and networking in one place.
- Designed for users with little to no cloud experience who need a simple alternative to more complex AWS services like EC2, RDS, ELB, and Route53.
- Offers low and predictable pricing and easy deployment.

**Key Features**
- Provides pre-configured templates for common use cases like LAMP Stack, Nginx, Node.js, WordPress, and Magento.
- Includes basic monitoring and notifications for Lightsail resources.
- Limited AWS integrations and no auto-scaling.
- Supports high availability, but with simpler configurations.

**Use Case Example**
- Simple Web Applications:
  1. Deploy a LAMP Stack or WordPress website using pre-configured templates.
  2. Ideal for small websites or development and testing environments.

# AWS Deployment and Developer Services

## Deployment Services

### CloudFormation
- **Purpose**: Infrastructure as Code (IaC) tool for deploying AWS resources using templates.
- **Key Features**:
  - Supports almost all AWS resources.
  - Enables repeatable infrastructure deployment across Regions and accounts.
- **Use Case**: Automating and standardizing infrastructure provisioning.

### Elastic Beanstalk
- **Purpose**: Platform as a Service (PaaS) for deploying applications.
- **Key Features**:
  - Simplifies deployment with predefined architectures (e.g., EC2, Load Balancer, RDS).
  - Supports certain programming languages and Docker.
- **Use Case**: Quickly deploy applications without worrying about underlying infrastructure.

### CodeDeploy
- **Purpose**: Deploy and upgrade applications on servers.
- **Key Features**:
  - Works with **EC2 instances** or **on-premises servers** (hybrid deployments).
- **Use Case**: Automating application deployments across AWS and on-premises environments.

### Systems Manager
- **Purpose**: Manage, patch, configure, and run commands on servers at scale.
- **Key Features**:
  - Works with AWS and on-premises infrastructure (hybrid service).
- **Use Case**: Centralized management of server fleets.

## Developer Services

### CodeCommit
- **Purpose**: Store code in private Git repositories.
- **Key Features**:
  - Version control and secure code storage.
- **Use Case**: Collaborate and manage source code in AWS.

### CodeBuild
- **Purpose**: Build and test code in a **serverless** environment.
- **Key Features**:
  - Fully managed CI tool for compiling and testing applications.
- **Use Case**: Automate build and test processes.

### CodeDeploy
- **Purpose**: Automate application deployments (also listed under Deployment Services).
- **Use Case**: Deploy code updates to EC2 instances or on-premises servers.

### CodePipeline
- **Purpose**: Orchestrate end-to-end CI/CD workflows.
- **Key Features**:
  - Automates code integration, testing, and deployment.
- **Use Case**: Set up a pipeline from code commit to production deployment.

### CodeArtifact
- **Purpose**: Store and manage software packages and dependencies.
- **Key Features**:
  - Works with package managers like Maven, npm, and PyPI.
- **Use Case**: Centralized management of software dependencies.

### AWS CDK (Cloud Development Kit)
- **Purpose**: Define cloud infrastructure using programming languages.
- **Key Features**:
  - Converts code (e.g., JavaScript, Python, Java) into CloudFormation templates.
- **Use Case**: Define infrastructure using familiar programming languages instead of JSON/YAML.

# Global Applications in AWS

### Route 53 (Global DNS)
- **Purpose**: Directs users to the closest deployment with the least latency.
- **Key Features**:
  - Global DNS service for routing traffic based on geographic location or latency.
  - Supports disaster recovery strategies by rerouting traffic during outages.
- **Use Case**: Map hostnames to IPs and ensure users are routed efficiently to the nearest deployment.

### CloudFront (Global Content Delivery Network)
- **Purpose**: Decreases latency by caching data in AWS Edge Locations.
- **Key Features**:
  - Works with Amazon S3 to replicate and cache application data globally.
  - Improves user experience by reducing latency for frequently accessed content.
- **Use Case**: Serve static assets (e.g., images, videos) from Edge Locations for faster delivery.

### S3 Transfer Acceleration
- **Purpose**: Speeds up global uploads and downloads to/from Amazon S3.
- **Key Features**:
  - Leverages AWS Edge Locations to transfer data more quickly.
- **Use Case**: Accelerate data transfers for users far from the S3 bucket's Region.

### Global Accelerator
- **Purpose**: Improves global application availability and performance.
- **Key Features**:
  - Uses AWS's global network and Edge Locations for faster routing.
- **Use Case**: Enhance the performance of global applications by routing user traffic through AWS's private network.

### AWS Outposts
- **Purpose**: Extends AWS infrastructure into on-premises data centers.
- **Key Features**:
  - Deploy AWS-managed Outposts Racks for on-premises AWS services.
- **Use Case**: Run AWS services locally while integrating with the AWS Cloud.

### WaveLength
- **Purpose**: Provides ultra-low latency for applications using **5G networks**.
- **Key Features**:
  - Brings AWS services to the Edge via telecom providers.
- **Use Case**: Ideal for applications requiring near-instant responses (e.g., gaming, IoT, AR/VR).

### Local Zones
- **Purpose**: Brings AWS resources closer to users in specific locations.
- **Key Features**:
  - Offers compute, database, and storage closer to users in cities like Boston, Dallas, Miami, etc.
  - Reduces latency for applications sensitive to delays.
- **Use Case**: Serve users in regions requiring very low latency access to resources.

# AWS Messaging and Streaming Services

### SQS (Simple Queue Service)
- **Purpose**: Queuing service to decouple applications.
- **Key Features**:
  - Messages retained for up to **14 days**.
  - **Consumers** split the reads, process messages, and delete them after processing.
- **Use Case**: Decouple applications by queueing tasks for asynchronous processing.

### SNS (Simple Notification Service)
- **Purpose**: Notification service for pub/sub messaging.
- **Key Features**:
  - **Producers** send messages to SNS topics.
  - **Subscribers** (e.g., Lambda, SQS, email, HTTP) receive messages.
  - Messages are **not stored** (no persistence).
- **Use Case**: Notify multiple subscribers of events.

### Kinesis
- **Purpose**: Real-time data streaming service.
- **Key Features**:
  - Supports **real-time analytics** and **data persistence**.
  - Processes streaming data for applications requiring immediate responses.
- **Use Case**: Stream and analyse real-time data (e.g., logs, IoT events).

### Amazon MQ
- **Purpose**: Managed message broker for **ActiveMQ** and **RabbitMQ**.
- **Key Features**:
  - Supports protocols like **MQTT**, **AMQP**, and **STOMP**.
  - Designed for migrating on-premises message brokers to the cloud.
- **Use Case**: Migrate on-premises message brokers to AWS.

# Cloud Monitoring Overview

### What is CloudWatch Metrics?
- CloudWatch provides **metrics** for monitoring AWS services (e.g., `CPUUtilization`, `NetworkIn`).
- Metrics are timestamped and visualized using **CloudWatch Dashboards**.
- Example Metrics:
  - **Billing Metric**: Tracks AWS spending, available only in `us-east-1`.
  - **EC2 Metrics**: CPU Utilization, Network In/Out, Status Checks.
  - **EBS Metrics**: Disk reads and writes.
  - **S3 Metrics**: Bucket size, object count, request count.
  - **Custom Metrics**: Push your own metrics if defaults are insufficient.
- **Default Monitoring**: Metrics are captured every **5 minutes**.
- **Detailed Monitoring**: Enables metrics every **1 minute** (additional cost).

---

### What are CloudWatch Alarms?
- **Alarms** trigger notifications or actions based on metric thresholds.
- Example Actions:
  - **Auto Scaling**: Adjust EC2 instance counts based on metrics.
  - **EC2 Actions**: Stop, terminate, reboot, or recover instances.
  - **SNS Notifications**: Send notifications (e.g., emails) for events.
- **Common Use Case**: 
  - Trigger an alarm if EC2 `CPUUtilization` exceeds 90%.
  - Notify via SNS or scale EC2 instances automatically.
- **Alarm States**:
  - **OK**: Everything is normal.
  - **INSUFFICIENT_DATA**: Not enough data to evaluate.
  - **ALARM**: Threshold exceeded or bad state detected.
- **Billing Alarms**:
  - Set alarms on the **Billing Metric** to monitor spending (e.g., $10 threshold).

# Introduction to VPC (Virtual Private Cloud)

### What is a VPC?
- A **Virtual Private Cloud** allows you to define a logically isolated network within AWS.
- Provides control over networking components, such as subnets, gateways, and routing.
- Essential for setting up secure and private environments for applications.

### Key Concepts to Know (High-Level Overview)

1. **VPC**: A virtual network that mimics a traditional on-premises data center network.
2. **Subnets**: Subsections of a VPC that divide resources into public and private areas.
3. **Internet Gateway**: Allows resources in a VPC to connect to the internet.
4. **NAT Gateway**: Enables private subnet resources to access the internet without exposing them.
5. **Security Groups**: Acts as a virtual firewall for your AWS resources, controlling inbound and outbound traffic.
6. **NACL (Network Access Control List)**: Provides stateless firewall rules for subnets.
7. **VPC Flow Logs**: Captures information about traffic flowing in and out of your VPC.
8. **VPC Peering**: Connects two VPCs for private communication.
9. **VPC Endpoints**: Allows private access to AWS services without using the internet.
10. **Site-to-Site VPN**: Securely connects your on-premises network to your VPC.
11. **Direct Connect**: Provides a dedicated network connection from your on-premises data center to AWS.
12. **Transit Gateway**: Central hub for connecting multiple VPCs and on-premises networks.