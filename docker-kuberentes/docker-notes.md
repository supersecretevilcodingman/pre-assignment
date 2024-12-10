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
