# Docker

Docker is a tool that helps you run applications inside isolated containers. These containers package the app and everything it needs (like libraries and settings) so that it runs the same on any computer.

### Key Points:
- **Docker Image**: A blueprint for creating containers with your app and its dependencies.
- **Docker Container**: A running instance of a Docker image.
- **Docker Hub**: A place to share Docker images.

### Use Cases:
1. **Simplified Deployment**: Run apps consistently across different environments.
2. **Microservices**: Break apps into smaller parts (services), each in its own container.
3. **CI/CD**: Automate app testing and deployment.
4. **Isolation**: Run multiple apps without conflicts.
5. **Portability**: Run containers anywhere that supports Docker.
6. **Scaling**: Easily add more containers to handle more traffic.
7. **Development & Testing**: Set up consistent environments for building and testing apps.

### Index
1. [Installation](#1-installation)  
2. [Docker Architecture](#2-docker-architecture)  
3. [Basic Docker Commands](#3-basic-docker-commands)  
4. [How to Use Docker](#4-how-to-use-docker)  
5. [Run Images from Docker Hub](#5-run-images-from-docker-hub)  
6. [Run Images with Dockerfile](#6-run-images-with-dockerfile)  
7. [Run Images with Docker Compose](#7-run-images-with-docker-compose)  
8. [Docker Volumes (Data Persistence)](#8-docker-volumes-data-persistence)  
9. [Docker Networks](#9-docker-networks)  
10. [Docker Logs and Debugging](#10-docker-logs-and-debugging)  
11. [Docker Exec vs Attach](#11-docker-exec-vs-attach)  
12. [Docker Image vs Container](#12-docker-image-vs-container)  
13. [Dockerfile Instructions Explained](#13-dockerfile-instructions-explained)  
14. [Docker Compose Advanced (Multiple Services)](#14-docker-compose-advanced-multiple-services)  
15. [Docker Registry (Local + Remote)](#15-docker-registry-local--remote)  
16. [Docker Swarm (Basic Clustering)](#16-docker-swarm-basic-clustering)  
17. [Docker vs Kubernetes](#17-docker-vs-kubernetes)  
18. [Best Practices in Docker](#18-best-practices-in-docker)  
19. [Common Docker Errors & Solutions](#19-common-docker-errors--solutions)  
20. [Docker Cheat Sheet](#20-docker-cheat-sheet)  
## 1 Installation

How to install Docker on Windows, Linux, and macOS.

- **Windows and Mac:** Download Docker Desktop from the official website and follow the installer.
- **Linux:** Use terminal commands like `sudo apt install docker.io` for Ubuntu or `sudo yum install docker` for CentOS.

After installation, run `docker --version` to check if Docker is installed properly.


[Detailed document](./01-Installation.md)

---

## 2 Docker Architecture

- **Docker Engine:** Core service that runs Docker.
- **Docker Daemon (`dockerd`):** Listens to Docker API requests and manages Docker objects.
- **Docker Client (`docker`):** CLI tool used to interact with Docker Daemon.
- **Docker Registries:** Store Docker images (e.g., Docker Hub).
- **Images and Containers:** Images are blueprints; containers are live instances of those images.

[Detailed document](./02-Docker-Architecture.md)

---

## 3 Basic Docker Commands

- `docker --version`: Check the installed Docker version.
- `docker run`: Run a container from an image.
- `docker ps`: List running containers.
- `docker stop <container>`: Stop a running container.
- `docker rm <container>`: Remove a stopped container.
- `docker rmi <image>`: Remove an image.

These commands help you manage the lifecycle of containers and images.

---

## 4 How to Use Docker

- **Pulling images**: Download images from Docker Hub using `docker pull <image>`.
- **Creating containers**: Use `docker run` to create and start containers.
- **Starting/stopping containers**: Use `docker start` and `docker stop`.

Example:
```bash
docker run -d -p 8080:80 nginx
```
This runs the `nginx` container in detached mode and maps port 80 of the container to 8080 of your machine.

---

## 5 Run Images from Docker Hub

- Use `docker pull nginx` to download the NGINX image.
- Run it using:
```bash
docker run -d -p 8080:80 nginx
```
This makes NGINX web server accessible at `http://localhost:8080`.

---

## 6 Run Images with Dockerfile

1. Create a `Dockerfile` with instructions to build your image.
2. Use:
```bash
docker build -t myimage .
```
This builds a Docker image from your Dockerfile in the current directory.
3. Run it with:
```bash
docker run -p 5000:5000 myimage
```
This starts a container from your custom image.

---

## 7 Run Images with Docker Compose

- Create a `docker-compose.yml` file defining services.
- Run all services with:
```bash
docker-compose up
```
- To stop:
```bash
docker-compose down
```
This allows you to manage multi-container applications easily.

---

## 8 Docker Volumes (Data Persistence)

- Volumes persist data beyond container life.
- Create volume:
```bash
docker volume create myvol
```
- Use it in a container:
```bash
docker run -v myvol:/app/data myimage
```
This binds `/app/data` inside the container to `myvol` on the host.

---

## 9 Docker Networks

- Default bridge network connects all containers.
- Create custom network:
```bash
docker network create mynet
```
- Attach containers to network:
```bash
docker run --network=mynet myimage
```
This helps containers communicate securely with each other.

---

## 10 Docker Logs and Debugging

- View logs:
```bash
docker logs <container>
```
- Inspect container details:
```bash
docker inspect <container>
```
- Monitor resource usage:
```bash
docker stats
```
These tools help you debug container issues.

---

## 11 Docker Exec vs Attach

- `exec` lets you run commands in a running container safely:
```bash
docker exec -it <container> bash
```
- `attach` connects you to the main process (use with caution):
```bash
docker attach <container>
```

---

## 12 Docker Image vs Container

- **Image:** Template with application code and environment.
- **Container:** Running instance of an image.

Example: An image is like a class, and a container is like an object.

---

## 13 Dockerfile Instructions Explained

- `FROM`: Base image to use
- `RUN`: Execute command while building image
- `COPY`: Copy files from host to image
- `CMD`: Default command when container starts
- `ENTRYPOINT`: Main process to run
- `ENV`: Set environment variables
- `EXPOSE`: Inform about ports to be used

---

## 14 Docker Compose Advanced (Multiple Services)

Example:
```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "80:80"
  db:
    image: mongo
```
Run both services with `docker-compose up`.

---

## 15 Docker Registry (Local + Remote)

- Docker Hub is a public registry.
- Local registry can be run like this:
```bash
docker run -d -p 5000:5000 registry
```
Push your image to it using:
```bash
docker tag myimage localhost:5000/myimage
```
```bash
docker push localhost:5000/myimage
```

---

## 16 Docker Swarm (Basic Clustering)

- Initialize swarm:
```bash
docker swarm init
```
- Deploy a service:
```bash
docker service create --replicas 3 -p 80:80 nginx
```
Docker Swarm allows managing multiple nodes (machines).

---

## 17 Docker vs Kubernetes

| Feature        | Docker Swarm   | Kubernetes     |
|----------------|----------------|----------------|
| Setup          | Simple         | Complex        |
| Scaling        | Manual         | Auto/Manual    |
| Ecosystem      | Limited        | Rich           |

---

## 18 Best Practices in Docker

- Use small base images like Alpine
- Reduce layers in Dockerfile
- Use `.dockerignore` to ignore unnecessary files
- Tag images with version numbers

---

## 19 Common Docker Errors & Solutions

- **Port already in use**: Use a different port
- **Permission denied**: Run with `sudo` or add user to `docker` group
- **Container not starting**: Check logs using `docker logs`

---

## 20 Docker Cheat Sheet

- List all containers:
```bash
docker ps -a
```
- List all images:
```bash
docker images
```
- Build image:
```bash
docker build -t myimage .
```
- Run all services:
```bash
docker-compose up -d
```
- Open terminal inside container:
```bash
docker exec -it mycontainer bash
```




---
---

### 2. Run Images from Docker Hub

Docker Hub is a repository where Docker images are stored and shared. To run an image from Docker Hub:

**Search for an Image**:
```bash
docker search <image_name>
```
Example:
```bash
docker search ubuntu
```

**Pull an Image from Docker Hub**:
```bash
docker pull <image_name>
```
Example:
```bash
docker pull ubuntu
```

**Run a Docker Container**:
```bash
docker run [OPTIONS] <image_name>
```

Example:
```bash
docker run -d -p 8080:80 --name mynginx nginx
```

- `-d`: Run in detached mode (background).
- `-p`: Map port on host to container (host_port:container_port).
- `--name`: Assign a name to the container.

---

### 3. Run Images with Dockerfile

A Dockerfile defines the steps to create a custom Docker image. Here's how to use it:

**Create a Dockerfile**:

Example Dockerfile:
```Dockerfile
FROM ubuntu:latest
RUN apt-get update && apt-get install -y apache2
COPY . /var/www/html
CMD ["apachectl", "-D", "FOREGROUND"]
```

**Build the Docker Image**:
```bash
docker build -t <image_name>:<tag> .
```
Example:
```bash
docker build -t myapp:v1 .
```

**Run the Image**:
```bash
docker run -d -p 8080:80 --name myapp-container myapp:v1
```

---

### 4. Run Images with Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. 

**Create a `docker-compose.yml` file**:

Example `docker-compose.yml`:
```yaml
version: '3'
services:
  web:
    image: nginx
    ports:
      - "8080:80"
  app:
    image: myapp:v1
    depends_on:
      - web
```

**Run the Docker Compose Application**:
```bash
docker-compose up -d
```

- `-d`: Run containers in the background.

**Stop the Docker Compose Application**:
```bash
docker-compose down
```

---

### Explanation of Common Docker Commands:

- **-d**: Detached mode (runs the container in the background).
- **-p**: Map port from host to container (`host_port:container_port`).
- **--name**: Assign a custom name to the container.
- **-t**: Allocate a pseudo-TTY, often used when running interactive processes.

---
