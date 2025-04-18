# Vagrant Setup for CentOS Stream 9 with Docker

This Vagrantfile sets up a virtual machine using **CentOS Stream 9** with **Docker Engine**, **Docker CLI**, and **Docker Compose Plugin** pre-installed. It also configures both private and public networking for versatile access and testing.

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
- Installs required DNF plugins.
- Adds Docker's official repository.
- Installs:
  - `docker-ce`
  - `docker-ce-cli`
  - `containerd.io`
  - `docker-buildx-plugin`
  - `docker-compose-plugin`
- Enables and starts the Docker service.
- Adds the current user to the `docker` group.
- Applies group changes using `newgrp docker`.

---

## 🐳 Docker Usage

Once inside the VM, you can run Docker commands like:

```bash
docker --version
docker ps
docker run hello-world
```