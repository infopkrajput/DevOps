# 🌐 Host a Website Manually on RHEL / Fedora / CentOS Using Vagrant

This guide will help you create a **CentOS Stream 9 virtual machine** using **Vagrant**, and then manually host a static website using the **httpd** web server (Apache).

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
  config.vm.box = "centos/stream9"
  config.vm.box_version = "20250310.0"

  config.vm.network "private_network", ip: "192.168.56.11"
  config.vm.network "public_network"

  # Optional VirtualBox settings:
  # config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
  #   vb.memory = "1024"
  # end

  # You can also add shell provisioning here if needed
end
```

---

## 🚀 How to Start Your VM

Open terminal or command prompt inside the project folder (where `Vagrantfile` exists) and run:

```sh
vagrant up
```

This will download the box (if not already downloaded) and create a VM using CentOS Stream 9.

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
yum install httpd zip unzip git -y
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
systemctl start httpd
systemctl enable httpd
```

---

## ✅ Completion Message

```sh
echo "Your Setup Completed Successfully"
```

Now open your browser and visit:

```
http://192.168.56.11
```

You should see your hosted website! 🎉

---

Let me know if you want to **automate these steps using a shell provisioner** inside the Vagrantfile for even easier setup.