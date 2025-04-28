# 05 Run Images from Docker Hub

## Run Images from Docker Hub

Docker Hub is a cloud-based registry where Docker users and partners create, test, store, and distribute container images. You can pull and run these images directly using Docker CLI.

### 🔹 Step 1: Search for an Image on Docker Hub

Use the search command or visit [https://hub.docker.com](https://hub.docker.com)

```bash
docker search <image-name>
```

Example:

```bash
docker search nginx
```

---

### 🔹 Step 2: Pull the Image

Use `docker pull` to download the image to your local system.

```bash
docker pull <image-name>
```

Example:

```bash
docker pull nginx
```

---

### 🔹 Step 3: Run the Image as a Container

Use the `docker run` command to start a container from the pulled image.

```bash
docker run <image-name>
```

#### Common Options

- `-d` → Detached mode (runs in background)
- `-p` → Port mapping (`hostPort:containerPort`)
- `--name` → Assign a custom name to your container
- `-it` → Interactive terminal (useful for shell-based containers)

---

### 🔹 Example 1: Run NGINX Web Server

```bash
docker run -d -p 8080:80 --name mynginx nginx
```

- Runs the NGINX image in detached mode
- Maps container’s port `80` to host port `8080`
- Container is named `mynginx`

Now, open [http://localhost:8080](http://localhost:8080) to view the web server.

---

### 🔹 Example 2: Run Ubuntu with Shell Access

```bash
docker run -it ubuntu bash
```

- Runs Ubuntu image with interactive terminal
- Gives you access to the bash shell

---

### 🔹 Example 3: Run MySQL Database

```bash
docker run -d -p 3306:3306 --name mysql-server -e MYSQL_ROOT_PASSWORD=root mysql
```

- Runs MySQL in the background
- Maps port 3306
- Sets root password as `root`

---

### 🔹 Step 4: Verify Running Containers

```bash
docker ps
```

Use this command to list running containers.

---

### 🔹 Step 5: Stop and Remove Containers

```bash
docker stop <container-name>
docker rm <container-name>
```
