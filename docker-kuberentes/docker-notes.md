# What is Docker?
- Docker refers to an ecosystem of tools, projects, and software used to create and manage containers.
- Common components of the Docker ecosystem include:
  - Docker Client: The command-line interface (CLI) for interacting with Docker.
  - Docker Server: Executes commands sent by the Docker client.
  - Docker Hub: A repository for sharing and storing Docker images.
  - Docker Compose: A tool for defining and running multi-container applications.

## What Are Containers?
- A container is an instance of an image, functioning as an isolated, running program.
- Containers provide their own isolated resources:
  - Memory
  - Networking
  - Storage
- Think of containers as a way to package and run software with all dependencies bundled in.

## Key Terminology

### Docker Image:
- A file containing all the dependencies and configuration needed to run a specific program.
- Stored on your hard drive and used to create containers.

### Docker Container:
- A running instance of a Docker image.
- Isolated from the host system and other containers.
- Manages its own:
  - Memory
  - Networking
  - Storage

### Kernel:
- The kernel is the core software of an operating system that mediates between running programs and hardware resources like memory, CPU, and storage.
- Programs interact with the kernel through system calls, which function like API endpoints for accessing hardware.

### Namespacing:
- Namespacing isolates hardware or software resources for specific processes or groups of processes.
- Examples of isolations provided by namespacing:
  - Segments of the hard drive.
  - Specific network interfaces.
  - Process visibility (limiting which processes can "see" each other).
- Ensures processes have access only to their allocated resources.

### Control Groups (cgroups):
- Control groups limit the amount of resources (CPU, memory, network bandwidth) a process or group of processes can consume.
- Ensures resource efficiency and prevents one process from monopolising system resources.

# Why Use Docker?
Docker simplifies the process of installing and running software by eliminating common challenges associated with traditional installation methods.

## Traditional Software Installation Challenges:
- Downloading an installer and running it often leads to errors.
- Errors require troubleshooting, searching for solutions online, and resolving dependencies manually.
- This cycle can be frustrating and time-consuming.

## Docker’s Solution:
- Streamlined Installation: Docker allows you to run software with a single command, bypassing manual setup and dependency installation.
- Universal Compatibility: Software can run on any machine—your personal computer, web servers, or cloud platforms—without modification.

