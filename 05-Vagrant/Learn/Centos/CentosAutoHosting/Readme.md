# 🚀 Auto Host a Website Using Vagrant + CentOS + Apache

This guide helps you **automatically provision** a CentOS Stream 9 virtual machine using **Vagrant**, install Apache (`httpd`), download a static website, and host it — **all automatically**! 🎉

---

## 📦 Prerequisites

Before running this project, install:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

---

## 📄 Vagrantfile Explained (Key Features)

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "centos/stream9"                         # Use CentOS Stream 9 as base OS
  config.vm.box_version = "20250310.0"                     # Use a specific box version

  config.vm.network "private_network", ip: "192.168.56.12" # Access site via this IP
  config.vm.network "public_network"                       # Allow internet access

  # Automatically install and configure Apache + website
  config.vm.provision "shell", inline: <<-SHELL
    sudo -i
    yum install httpd zip unzip git -y
    cd /var/www/html/
    curl https://www.tooplate.com/zip-templates/2132_clean_work.zip -o file.zip
    unzip file.zip -d temp_folder
    mv temp_folder/*/* /var/www/html/
    sudo rm -rf temp_folder file.zip
    systemctl start httpd
    systemctl enable httpd
    echo "Your Setup Completed Successfully"
  SHELL
end
```

---

### 1️⃣ Start the VM

```sh
vagrant up
```

- This will:
  - Download CentOS Stream 9 box (if not already)
  - Create a VM
  - Automatically install `httpd`, unzip, git
  - Download and extract a sample website
  - Start and enable Apache server

---

### 2️⃣ Access the Website

Open your browser and go to:

```
http://192.168.56.12
```

You’ll see the sample website hosted automatically! 🎉

---

## ✅ Final Output

```sh
Your Setup Completed Successfully
```
