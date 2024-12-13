- [What is Docker?](#what-is-docker)
  - [What Are Containers?](#what-are-containers)
  - [Key Terminology](#key-terminology)
    - [Docker Image:](#docker-image)
    - [Docker Container:](#docker-container)
    - [Kernel:](#kernel)
    - [Namespacing:](#namespacing)
    - [Control Groups (cgroups):](#control-groups-cgroups)
- [Why Use Docker?](#why-use-docker)
  - [Traditional Software Installation Challenges:](#traditional-software-installation-challenges)
  - [Docker's Solution:](#dockers-solution)
- [Docker Commands](#docker-commands)
  - [`docker run`](#docker-run)
    - [Behind the Scenes:](#behind-the-scenes)
      - [`docker create` and `docker start`](#docker-create-and-docker-start)
    - [Overriding the Default Command](#overriding-the-default-command)
      - [Listing Files](#listing-files)
  - [`docker ps`](#docker-ps)
    - [Show All Containers](#show-all-containers)
  - [`docker system prune`](#docker-system-prune)
    - [`docker stop`, `docker kill`](#docker-stop-docker-kill)
    - [`docker exec`](#docker-exec)
      - [Communication Channels in Linux](#communication-channels-in-linux)
  - [Creating Custom Docker Images](#creating-custom-docker-images)
    - [Steps to Build a Custom Docker Image](#steps-to-build-a-custom-docker-image)
    - [The Dockerfile Structure](#the-dockerfile-structure)
    - [Key Components](#key-components)
- [Custom Alpine-Based Docker Image Example](#custom-alpine-based-docker-image-example)
    - [1. Set Up the Project Directory](#1-set-up-the-project-directory)
    - [2. Create a Python Script](#2-create-a-python-script)
    - [3. Write the Dockerfile](#3-write-the-dockerfile)
    - [4. Build the Docker Image](#4-build-the-docker-image)
    - [5. Run the Docker Image](#5-run-the-docker-image)
  - [Explanation of the Dockerfile](#explanation-of-the-dockerfile)
    - [1. Base Image](#1-base-image)
    - [2. Install Dependencies](#2-install-dependencies)
    - [3. Copy Files](#3-copy-files)
    - [4. Startup Command](#4-startup-command)
- [Docker `simpleweb` Project](#docker-simpleweb-project)
- [Docker `visits` Project Via `docker-compose`](#docker-visits-project-via-docker-compose)


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

## Docker's Solution:
- Streamlined Installation: Docker allows you to run software with a single command, bypassing manual setup and dependency installation.
- Universal Compatibility: Software can run on any machine—your personal computer, web servers, or cloud platforms—without modification.

# Docker Commands

## `docker run`
The `docker run` command:
- Creates and runs a container based on the specified image.
- Takes the file system snapshot (image) and creates an isolated environment (container).
- Executes the startup command defined in the image.
- A combination of `docker create` and `docker start`

### Behind the Scenes:
1. Docker checks if the image is available locally.
- If not, it pulls the image from Docker Hub.
2. The image is used to create a container with isolated resources.
3. The specified program in the image (e.g., hello-world) is executed.
4. The container stops when the program completes.

#### `docker create` and `docker start`

`docker create`:
- Creates a container from an image without starting it.
- Prepares the file system and allocates resources but does not execute the startup command.

`docker start`:
- Starts an already created container and executes its startup command.
- Can be used with or without additional options like `-a` for logs.
  - Since `docker start -a` could take a couple minutes to load, you can `start` the container and then use `docker logs <container-id>` to get all the records.

You would typically use these for more granular control. 

### Overriding the Default Command
`docker run <image-name> <custom-command>` can be used to override the default command included in the image by specifiying your own command after the `<image-name>`. 

An example of this would be...

#### Listing Files
`docker run busybox ls` will list files and directories in the container's root file system. These directories belong to the container's isolated file system, not your local machine. This can be used if a specialised image doesn't have something like the `ls` command. 

## `docker ps`
The `docker ps` command:
- Lists all running containers on your machine.
- Displays detailed information about active containers.

### Show All Containers
`docker ps --all` can be used to list containers that are running and exited - essentially a history of all containers created on the machine.

## `docker system prune`
`docker system prune` is used to free up disk space when containers / images are no longer needed.
1. Deletes stopped containers.
2. Removes unused:
   - Images
   - Networks
   - Build cache

### `docker stop`, `docker kill`
The `docker stop <container-id>` command: 
- Sends a SIGTERM (terminate) signal to the container's main process.
- Allows the process to shut down gracefully, clean up, and save any necessary data.
- If the container does not stop within 10 seconds, Docker automatically sends a SIGKILL signal to force termination.

`docker kill`:
- Sends a SIGKILL (kill) signal to the container's main process.
Immediately terminates the process without allowing cleanup or graceful shutdown.

### `docker exec`
The docker exec command allows you to execute additional commands inside an already running container.
Useful for interacting with or managing processes inside containers.

`docker exec -it <container-id> <command>`: 
- `-it`: Combines two options:
  - `-i` (interactive): Keeps STDIN open, allowing you to type input.
  - `-t` (pseudo-TTY): Allocates a terminal for the command.
- Together, `-it` enables interactive usage, such as running a shell or CLI inside the container.

`docker exec -it <container-id> sh`:
- Allows you to enter the container and execute commands inside of it using powershell.

#### Communication Channels in Linux
Every process in a Linux environment has three communication channels:
- STDIN (Standard Input):
  - Accepts input directed into the process (e.g., text typed into the terminal).
- STDOUT (Standard Output):
  - Outputs regular data from the process (e.g., command results).
- STDERR (Standard Error):
  - Outputs error messages from the process.


## Creating Custom Docker Images
Custom images allow you to run your own applications inside containers.
The process revolves around creating a Dockerfile, a configuration file that defines the image's behaviour.

### Steps to Build a Custom Docker Image
Create a Dockerfile:
- A plain text file with configuration instructions for the image.
- Specifies:
  - Base image
  - Commands to configure the image (e.g., install dependencies)
  - A startup command for the container.

Build the Image:
- Use the docker build command to create the image based on the Dockerfile.

Run the Image:
- Use docker run to create and start a container from your custom image.

### The Dockerfile Structure
Base Image:
- The starting point for your image.
- Example: FROM busybox, FROM node, FROM ubuntu.

Commands:
- Used to add software, files, or dependencies to the image.
- Example: RUN apt-get install, COPY, ADD.

Startup Command:
- Defines the default command executed when the container starts.
- Example: CMD ["node", "app.js"].

### Key Components
- Docker Client: Passes the Dockerfile to the Docker server.
- Docker Server: Reads the Dockerfile, processes the instructions, and builds the image.

# Custom Alpine-Based Docker Image Example
Create a custom Docker image using the Alpine base image that runs a Python script when the container starts.

### 1. Set Up the Project Directory
Create a directory for the project:
```bash
mkdir alpine-python
cd alpine-python
```

### 2. Create a Python Script
Create a `script.py` file inside the directory:
```bash
touch script.py
```

Add the following Python code to the file:
```python
print("Hello from Alpine-based Python container!")
```

### 3. Write the Dockerfile
Create a `Dockerfile` in the same directory:
```bash
touch Dockerfile
```

Add the following content to the `Dockerfile`:
```dockerfile
# Use the Alpine base image
FROM alpine

# Install Python3 and pip
RUN apk add --no-cache python3 py3-pip

# Copy the Python script into the container
COPY script.py /script.py

# Set the default command to run the Python script
CMD ["python3", "/script.py"]
```

### 4. Build the Docker Image
Run the following command to build the image:
```bash
docker build -t alpine-python .
```
- `-t alpine-python`: Tags the image with the name `alpine-python`.
- `.`: Specifies the current directory contains the `Dockerfile`.

### 5. Run the Docker Image
Start a container from the custom image:
```bash
docker run alpine-python
```

Output:
```
Hello from Alpine-based Python container!
```

## Explanation of the Dockerfile

### 1. Base Image
- `FROM alpine`: Starts with a lightweight Linux distribution.

### 2. Install Dependencies
- `RUN apk add --no-cache python3 py3-pip`: Installs Python 3 and pip using Alpine's package manager.

### 3. Copy Files
- `COPY script.py /script.py`: Adds the local Python script into the container.

### 4. Startup Command
- `CMD ["python3", "/script.py"]`: Executes the Python script when the container starts.

# Docker `simpleweb` Project
1. Create your [package.json](simpleweb/package.json) and [index.js](simpleweb/index.js) files.
2. Create the [Dockerfile](simpleweb/Dockerfile). 
3. Open a GitBash window and `cd` to the `simpleweb` directory.
4. Use `docker build .` to build the project using the current directory.
5. Use `docker login` to validate your credentials if you wish to push the image.
6. Tag the build using `docker build -t <username>/simpleweb .`. This will build using `:latest` since we didn't not specify a version.
7. Use `docker run -p 8080:8080 <image-id>` to port map and allow access on port `8080`. Go to `localhost:8080` to see the page.

Making changes in any file will require you to rebuild the image, which in larger projects, could be large wait times. To help reduce this, we can copy the package.json file during the initial copy. This means that you can make as many changes as you want to the `index.js` file without having to rebuild the whole image because it will not invalidate the cache for the steps above it.

# Docker `visits` Project Via `docker-compose`
1. Create your [package.json](visits/package.json) and [index.js](visits/index.js) files.
2. Create the [Dockerfile](visits/Dockerfile). 
3. Open a GitBash window and `cd` to the `visits` directory.
4. Use `docker build .` to build the project using the current directory.
5. Use `docker login` to validate your credentials if you wish to push the image.
6. Tag the build using `docker build -t <username>/simpleweb:latest .`. 
7. Create your [docker-compose.yaml](visits/docker-compose.yaml) so that you can connect the `node-app` container to the `redis-server` container, allowing them to communicate.
8. Use `docker-compose up` to spin up the services so you can then access the page.