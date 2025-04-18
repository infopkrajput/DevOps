# 🐳 Dockerfile: Marketing Website with Apache Server

This Dockerfile builds a containerized Apache web server that serves a free **Tween Agency** HTML template (from Tooplate). It uses **multi-stage builds** to keep the final image clean and lightweight.

---

## 📁 Project Overview

- **Base Image**: `ubuntu:latest`
- **Web Server**: Apache2
- **Template Source**: [Tween Agency – Tooplate.com](https://www.tooplate.com/view/2128-tween-agency)
- **Use Case**: Static marketing website hosted inside a Docker container.

---

## 🔧 How to Build and Run

### 1. **Build the Docker Image**

```bash
docker build -t myimage .
```

### 2. **Run the Container**

```bash
docker run -d -p 8080:80 --name host-website myimage
```

### 3. **Open in Browser**

Visit: [http://localhost:8080](http://localhost:8080)

---

## 📦 Dockerfile Breakdown & Explanation

```dockerfile
FROM ubuntu:latest AS BUILD_IMAGE
```
➡ Creates a temporary **build stage** named `BUILD_IMAGE` using the latest Ubuntu.

```dockerfile
RUN apt update && apt install wget unzip -y
```
➡ Updates the package list and installs `wget` and `unzip` tools.

```dockerfile
RUN wget https://www.tooplate.com/zip-templates/2128_tween_agency.zip
```
➡ Downloads the Tween Agency HTML template ZIP file from Tooplate.

```dockerfile
RUN unzip 2128_tween_agency.zip && cd 2128_tween_agency && tar -czf tween.tgz * && mv tween.tgz /root/tween.tgz
```
➡ Unzips the template, compresses its contents into a `tween.tgz` archive, and moves it to `/root` to be copied later.

---

```dockerfile
FROM ubuntu:latest
```
➡ Starts a new **final stage** from scratch using Ubuntu again for a clean base.

```dockerfile
LABEL "project"="host-website"
```
➡ Adds a label to identify the project.

```dockerfile
ENV DEBIAN_FRONTEND=noninteractive
```
➡ Prevents interactive prompts during `apt install`.

```dockerfile
RUN apt update && apt install apache2 git wget -y
```
➡ Installs Apache web server, `git`, and `wget`.

```dockerfile
COPY --from=BUILD_IMAGE /root/tween.tgz /var/www/html/
```
➡ Copies the archive `tween.tgz` from the `BUILD_IMAGE` stage to the Apache HTML directory.

```dockerfile
RUN cd /var/www/html/ && tar -xzf tween.tgz
```
➡ Extracts the website files into `/var/www/html/`.

```dockerfile
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```
➡ Sets Apache to run in the foreground (default behavior in containers).

```dockerfile
VOLUME /var/log/apache2
```
➡ Declares a volume for Apache logs so logs can be persisted externally.

```dockerfile
WORKDIR /var/www/html/
```
➡ Sets the working directory inside the container.

```dockerfile
EXPOSE 80
```
➡ Informs Docker that the container will listen on port 80 (standard HTTP port).

---

## 📝 Notes

- This Dockerfile demonstrates a **multi-stage build** to keep the final image lightweight and avoid leaving behind unnecessary build tools.
- Ideal for serving a static HTML website with no backend or database.

---

