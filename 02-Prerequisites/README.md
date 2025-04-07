# 02-Prerequisites

## **Tools & Accounts Required for DevOps Setup**  

## **📌 Essential Tools**  
To start with DevOps, the following tools are required:  

### **🔧 Software & Tools**  
- **Oracle VM VirtualBox** – For running virtual machines.  
- **Git** – Version control system.  
- **Vagrant** – Manages virtual machine environments.  
- **Chocolatey** – Windows package manager.  
- **JDK 8** – Java Development Kit for Java applications.  
- **Maven** – Build automation tool for Java projects.  
- **IntelliJ IDEA** – Java IDE for development.  
- **Sublime Text** – Lightweight text editor.  
- **AWS CLI** – Command-line interface for managing AWS services.  

---

## **📌 Sign-Up Requirements**  
Before proceeding, create accounts on these platforms:  
- **GitHub** – For managing source code repositories.  
- **Domain Purchase** – (GoDaddy/Namecheap) for hosting services.  
- **DockerHub** – For storing and sharing Docker images.  
- **SonarCloud** – For static code analysis.  

---

## **📌 AWS Setup**  
To use AWS services, ensure the following setup is completed:  
- ✅ **Free Tier Account** – Create an AWS free-tier account.  
- ✅ **IAM with MFA** – Secure AWS account with IAM and Multi-Factor Authentication (MFA).  
- ✅ **Billing Alarm** – Set up billing alerts to avoid unexpected charges.  
- ✅ **Certificate Setup** – Configure SSL/TLS certificates for secure connections.  

---

## **📌 Installation Commands (Chocolatey)**  
For Windows users, install tools using **Chocolatey**:  

```sh
# Upgrade Chocolatey
choco upgrade chocolatey  

# Install required tools  
choco install virtualbox --version=7.1.4 -y  
choco install vagrant --version=2.4.3 -y  
choco install git -y  
choco install corretto17jdk -y  
choco install maven -y  
choco install intellijidea-community -y  
choco install vscode -y  
choco install sublimetext3 -y  
```

---

## **📌 Useful Links**  
Here are the official links to download tools and create accounts:  

- **[Chocolatey](https://chocolatey.org/)**
- **[GitHub](https://github.com/)**
- **[GoDaddy (Domain Purchase)](https://www.godaddy.com/)**
- **[Namecheap (Domain Purchase)](https://www.namecheap.com/)**
- **[DockerHub](https://hub.docker.com/)**
- **[SonarCloud](https://sonarcloud.io/)**
- **[AWS Free Tier](https://aws.amazon.com/free/)**  

---

## < 1️⃣[Introduction](../01-Introduction/README.md) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HOME](../README.md)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3️⃣[VM Setup](../03-VM-Setup/README.md) >