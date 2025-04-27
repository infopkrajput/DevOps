# 04 How to Use Docker

## How to use Docker?

Docker makes it easy to create, manage, and deploy containers using simple CLI commands. Below are some of the common operations you’ll use frequently while working with Docker.


### 🔹 Pulling Images

Download pre-built images from Docker Hub:

```bash
docker pull <image-name>
```

Example:

```bash
docker pull ubuntu
```

---

### 🔹 Creating and Running Containers

Create and run a container from an image:

```bash
docker run <image-name>
```

#### Common options:

- `-d`: Run container in detached mode (in background)
- `-p hostPort:containerPort`: Map ports
- `--name`: Name the container
- `-it`: Interactive terminal (useful for Ubuntu/bash)

**Example**:

```bash
docker run -d -p 8080:80 --name webserver nginx
```

This runs the **nginx** container in background and maps port `80` inside the container to port `8080` on your local machine.

---

### 🔹 Viewing Running Containers

```bash
docker ps            # Show running containers
docker ps -a         # Show all containers (including stopped)
```

---

### 🔹 Starting, Stopping, Restarting Containers

```bash
docker start <container-name-or-id>
docker stop <container-name-or-id>
docker restart <container-name-or-id>
```

---

### 🔹 Removing Containers and Images

```bash
docker rm <container-name-or-id>      # Remove a container
docker rmi <image-name-or-id>         # Remove an image
```

You must stop a container before removing it.

---

### 🔹 Running Commands Inside a Container

Use `exec` to run a command in a running container:

```bash
docker exec -it <container-name-or-id> bash
```

Example (get shell inside Ubuntu container):

```bash
docker exec -it ubuntu-container bash
```
