# 06 Run Images with Dockerfile

Here’s a complete **guide for “Run Images with Dockerfile”** including:

- What is a Dockerfile
- How to build an image
- How to run a container
- Example Dockerfiles (with explanation)
- Explanation of common Dockerfile commands

---

## Run Images with Dockerfile

A **Dockerfile** is a text document that contains instructions to build a Docker image step-by-step. It automates the image creation process.

---

### 🔹 Step 1: Create a Dockerfile

Create a file named `Dockerfile` (without extension) in your project directory.

---

### 🔹 Step 2: Write Instructions in Dockerfile

Below are some basic Dockerfile instructions:

| Instruction | Description |
|------------|-------------|
| `FROM` | Base image to start from |
| `RUN` | Execute a command while building the image |
| `COPY` | Copy files/folders from host to image |
| `WORKDIR` | Set working directory inside container |
| `CMD` | Default command to run when container starts |
| `EXPOSE` | Inform which port the app runs on |
| `ENV` | Define environment variables |

---

### 🔹 Step 3: Build Docker Image

```bash
docker build -t <image-name>:<tag> .
```

Example:

```bash
docker build -t myapp:v1 .
```

- `-t` gives name and optional version tag
- `.` means Dockerfile is in current directory

---

### 🔹 Step 4: Run Container from Built Image

```bash
docker run -d -p 8080:80 --name myapp-container myapp:v1
```

- `-d`: Detached mode
- `-p`: Port mapping
- `--name`: Assign a name to the container

---

## 🔧 Dockerfile Examples

### 📘 Example 1: Basic Nginx Web Server

**Directory Structure:**

```bash
project/
├── Dockerfile
└── index.html
```

**Dockerfile:**

```Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
```

**Command to Build and Run:**

```bash
docker build -t mynginx:v1 .
docker run -d -p 8080:80 --name web mynginx:v1
```

➡️ Open `http://localhost:8080` to view your HTML file.

---

### 📘 Example 2: Python Flask App

**Directory Structure:**

```bash
flask-app/
├── Dockerfile
├── app.py
└── requirements.txt
```

**app.py:**

```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Flask inside Docker!"
```

**requirements.txt:**

```bash
flask
```

**Dockerfile:**

```Dockerfile
FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]
```

**Build & Run:**

```bash
docker build -t flaskapp:v1 .
docker run -d -p 5000:5000 --name flask-server flaskapp:v1
```

➡️ Open `http://localhost:5000` in your browser.

---

### 📘 Example 3: Node.js Express App

**Directory Structure:**

```bash
node-app/
├── Dockerfile
├── package.json
└── index.js
```

**index.js:**

```js
const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello from Node.js Docker!'));
app.listen(3000, () => console.log('Server running on port 3000'));
```

**package.json:**

```json
{
  "name": "nodeapp",
  "version": "1.0.0",
  "main": "index.js",
  "dependencies": {
    "express": "^4.18.2"
  }
}
```

**Dockerfile:**

```Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "index.js"]
```

**Build & Run:**

```bash
docker build -t nodeapp:v1 .
docker run -d -p 3000:3000 --name node-server nodeapp:v1
```

➡️ Open `http://localhost:3000`

---

## 📘 Summary of Dockerfile Commands

| Command | Description |
|--------|-------------|
| `FROM` | Sets base image (e.g. `nginx:alpine`, `python:3.10`) |
| `WORKDIR` | Sets working directory inside the container |
| `COPY` | Copies files from your system to container image |
| `RUN` | Executes commands during image build (e.g. installing packages) |
| `CMD` | Sets the default command for container at runtime |
| `EXPOSE` | Declares port the app runs on |
| `ENV` | Sets environment variables |
