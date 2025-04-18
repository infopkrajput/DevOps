## 1 Installation

This guide will help you install Docker on various platforms including **Windows**, **Linux**, and **Mac**.

---

### 🪟 Install Docker on Windows

**Steps**:

1. Download Docker Desktop from the official site:  
   👉 [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)

2. Run the installer and follow the setup wizard.

3. After installation, restart your system if required.

4. Open Docker Desktop and wait until Docker starts successfully.

5. Open Command Prompt or PowerShell and verify installation:
   ```bash
   docker --version
   ```

✅ If you see the Docker version printed, installation is successful.

---

### 🐧 Install Docker on Linux (Ubuntu/Debian)

**Steps**:

1. Update your system:
   ```bash
   sudo apt update
   ```

2. Install Docker:
   ```bash
   sudo apt install docker.io
   ```

3. Start Docker service:
   ```bash
   sudo systemctl start docker
   ```

4. Enable Docker to start on boot:
   ```bash
   sudo systemctl enable docker
   ```

5. Check Docker status:
   ```bash
   sudo systemctl status docker
   ```

6. Verify Docker version:
   ```bash
   docker --version
   ```

✅ Output like `Docker version 20.10.xx` confirms successful installation.

📌 **Tip**: You can add your user to the `docker` group to run Docker without `sudo`.

```bash
sudo usermod -aG docker $USER
newgrp docker
```

---

### 🍎 Install Docker on macOS

**Steps**:

1. Download Docker Desktop for Mac:  
   👉 [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)

2. Install Docker by dragging the Docker icon into your Applications folder.

3. Open Docker Desktop and wait for it to initialize.

4. Open terminal and check Docker:
   ```bash
   docker --version
   ```

✅ Docker should now be ready to use on your Mac.

---