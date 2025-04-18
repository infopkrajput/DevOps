# Vagrant Setup for Ubuntu Jammy 22.04 with Docker

This Vagrantfile sets up a virtual machine using **Ubuntu 22.04 (Jammy Jellyfish)** with **Docker Engine**, **Docker CLI**, and **Docker Compose Plugin** pre-installed. It also configures both private and public networking and allocates 2GB RAM to the VM for smoother performance.

---

## 📁 Setup Instructions

1. Clone this repo or copy the Vagrantfile into a directory.  
2. Open a terminal in that directory.  
3. Run the following command:

```bash
vagrant up
```

4. SSH into the machine once provisioning is done:

```bash
vagrant ssh
```

---

## ⚙️ Provisioning Script Overview

The shell provisioner performs the following:

- Updates system packages.
- Installs essential packages for Docker installation.
- Adds Docker's GPG key and official repository.
- Installs:
  - `docker-ce`
  - `docker-ce-cli`
  - `containerd.io`
  - `docker-buildx-plugin`
  - `docker-compose-plugin`
- Adds the `vagrant` user to the `docker` group.
- Starts and enables the Docker service.
- Verifies Docker installation using `hello-world`.

---

## 💻 Virtual Machine Specs

- **Base Box**: `ubuntu/jammy64`
- **Box Version**: `20241002.0.0`
- **RAM**: 2048 MB
- **Private Network IP**: `192.168.56.82`
- **Public Network**: Enabled

---

## 🐳 Docker Usage

Once inside the VM, you can run Docker commands like:

```bash
docker --version
docker ps
docker run hello-world
```