# 03 Basic Docker Commands

## Here are some basic Docker commands that every beginner should know 👇 

### 🔹 Docker Installation Check

```bash
docker --version
```

---

### 🔹 Docker Service

```bash
sudo systemctl start docker   # Start Docker
sudo systemctl stop docker    # Stop Docker
sudo systemctl restart docker # Restart Docker
sudo systemctl status docker  # Check status
```

---

### 🔹 Docker Images

```bash
docker pull <image-name>         # Download image from Docker Hub
docker images                    # List all downloaded images
docker rmi <image-id>            # Remove an image
```

Example:

```bash
docker pull ubuntu
```

---

## 🔹 Docker Containers

```bash
docker run <image-name>                  # Run a container
docker run -it <image-name>              # Run in interactive mode
docker run -d <image-name>               # Run in detached mode (background)
docker run --name mycontainer <image>    # Give a name to container
docker ps                                # Show running containers
docker ps -a                             # Show all containers (including stopped)
docker stop <container-id/name>          # Stop a container
docker start <container-id/name>         # Start a stopped container
docker restart <container-id/name>       # Restart a container
docker rm <container-id/name>            # Remove a container
```

---

## 🔹 Docker Container Logs

```bash
docker logs <container-id/name>
```

---

## 🔹 Docker Exec (Run command inside container)

```bash
docker exec -it <container-id/name> bash
```
