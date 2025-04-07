# 💻 VProfile Project Setup

This project sets up a multi-tier architecture using **5 Virtual Machines (VMs)** to run various services required by the VProfile application. Each service runs on a dedicated VM for modularity and scalability.

---

## ✅ Prerequisites

Before starting, ensure the following tools are installed:

1. **Oracle VM VirtualBox**  
   [Download VirtualBox](https://www.virtualbox.org/)

2. **Vagrant**  
   [Download Vagrant](https://www.vagrantup.com/)

3. **Vagrant Plugin: `vagrant-hostmanager`**  
   This plugin manages `/etc/hosts` entries across all VMs.

   ```bash
   vagrant plugin install vagrant-hostmanager
   ```

4. **Git Bash** (on Windows) or any Unix shell emulator

---

## 🚀 Getting Started

Clone the project and launch all VMs using:

```bash
vagrant up
```

---

## 🖥️ VM & Service Overview

This project deploys **6 key services** on **5 VMs** as shown below:

| Service       | Description                  | VM        |
|---------------|------------------------------|-----------|
| **MySQL**     | SQL Database                 | `db01`    |
| **Memcached** | DB Caching                   | `mc01`    |
| **RabbitMQ**  | Broker / Messaging Queue     | `rmq01`   |
| **Tomcat**    | Java Application Server      | `app01`   |
| **Nginx**     | Web Server / Reverse Proxy   | `web01`   |
| **Elasticsearch** | Search & Indexing Engine | `app01` (optional)|

> Services should be installed in the **following order**:
> 1. MySQL  
> 2. Memcached  
> 3. RabbitMQ  
> 4. Tomcat  
> 5. Nginx

---

**💿[1. MySQL Setup (on db01)](./1.MySQL_Setup.md)**

**🧠[2. Memcached Setup (on mc01)](./2.Memcached_setup.md)**

**📩[3. RabbitMQ Setup (on rmq01)](./3.RabbitMQ.md)**

**🛠️[4. Tomcat Setup (on app01)](./4.Tomcat.md)**
