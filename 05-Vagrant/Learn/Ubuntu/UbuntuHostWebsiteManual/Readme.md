# 🌐 Host a Website Manually on Ubuntu 22.04 (Jammy) Using Vagrant

This guide helps you create an **Ubuntu 22.04 virtual machine** using **Vagrant**, and then manually host a static website using the **Apache (httpd)** web server.

---

## 💻 Prerequisites

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)
- Internet connection

---

## 📁 Vagrant File

Create a folder and inside that, create a file named `Vagrantfile` with the following content:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.box_version = "20241002.0.0"

  config.vm.network "private_network", ip: "192.168.56.13"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
  end

  # Uncomment for provisioning:
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
```

---

## 🚀 How to Start Your VM

Open your terminal inside the project folder (where the `Vagrantfile` is located) and run:

```sh
vagrant up
```

This will download the Ubuntu Jammy box (if not already downloaded) and create a VM.

To access the VM:

```sh
vagrant ssh
```

---

## 🛠️ Setup Apache Web Server Manually (Inside VM)

Now follow these steps **inside the VM** after `vagrant ssh`:

### 1️⃣ Switch to Root User

```sh
sudo -i
```

### 2️⃣ Install Required Packages

```sh
apt update
apt install apache2 zip unzip git curl -y
```

### 3️⃣ Move to Website Directory

```sh
cd /var/www/html/
```

### 4️⃣ Download a Sample Website Template

```sh
curl https://www.tooplate.com/zip-templates/2132_clean_work.zip -o file.zip
```

### 5️⃣ Extract and Move Website Files

```sh
unzip file.zip -d temp_folder
mv temp_folder/*/* /var/www/html/
```

### 6️⃣ Clean Up Temporary Files

```sh
rm -rf temp_folder file.zip
```

### 7️⃣ Start and Enable Apache Server

```sh
systemctl start apache2
systemctl enable apache2
```

---

## ✅ Completion Message

```sh
echo "Your Setup Completed Successfully"
```

Now open your browser and visit:

```
http://192.168.56.13
```

You should see your hosted website! 🎉

