# 🚀 Auto Host a Website Using Vagrant + Ubuntu + Apache

This guide helps you **automatically provision** an **Ubuntu 22.04 (Jammy)** virtual machine using **Vagrant**, install **Apache (apache2)**, download a sample static website, and host it — **all without manual steps**! 🎉

---

## 📦 Prerequisites

Before running this project, install:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)

---

## 📄 Vagrantfile Explained (Key Features)

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"                         # Use Ubuntu 22.04 as base OS
  config.vm.box_version = "20241002.0.0"                   # Use a specific box version

  config.vm.network "private_network", ip: "192.168.56.14" # Access site via this IP
  config.vm.network "public_network"                       # Allow internet access

  config.vm.provider "virtualbox" do |vb|                  # VM hardware config
    vb.gui = true
    vb.memory = "2048"
  end

  # Automatically install and configure Apache + website
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt update
    sudo apt install apache2 zip unzip git curl -y
    cd /var/www/html/
    curl https://www.tooplate.com/zip-templates/2132_clean_work.zip -o file.zip
    unzip file.zip -d temp_folder
    sudo mv temp_folder/*/* /var/www/html/
    sudo rm -rf temp_folder file.zip
    sudo systemctl start apache2
    sudo systemctl enable apache2
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
  - Download Ubuntu Jammy box (if not already)
  - Create a VM
  - Automatically install `apache2`, unzip, curl, git
  - Download and extract a sample website
  - Start and enable Apache server

---

### 2️⃣ Access the Website

Open your browser and go to:

```
http://192.168.56.14
```

You’ll see the sample website hosted automatically! 🎉

---

## ✅ Final Output

```sh
Your Setup Completed Successfully
```
