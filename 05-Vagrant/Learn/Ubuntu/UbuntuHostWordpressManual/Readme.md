# 🌐 Manually Host WordPress on Ubuntu with Vagrant

This guide will help you **manually host a WordPress website** on a **Ubuntu 22.04 virtual machine** using **Vagrant**, **Apache**, **MySQL**, and **PHP**.

---

## 💻 Prerequisites

Make sure the following tools are installed on your host machine:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads)
- Internet connection

---

## 📁 Vagrant File Setup

Create a folder and inside it, create a `Vagrantfile` with the following content:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.box_version = "20241002.0.0"

  config.vm.network "private_network", ip: "192.168.56.15"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end
```

---

## 🚀 Start and Access the VM

Open a terminal in your project folder and run:

```sh
vagrant up
```

To enter the VM:

```sh
vagrant ssh
```

Once inside:

```sh
sudo -i
```

---

## 🛠️ Install Apache, MySQL, PHP and WordPress

### 1️⃣ Update Packages and Install LAMP Stack

```sh
apt update
apt install apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip -y
```

### 2️⃣ Download and Extract WordPress

```sh
mkdir -p /srv/www
chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
```

---

## 🌍 Configure Apache for WordPress

### 3️⃣ Create Apache Config File

```sh
nano /etc/apache2/sites-available/wordpress.conf
```

Paste the following content:

```apache
<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>
```

### 4️⃣ Enable WordPress Site and Rewrite Module

```sh
a2ensite wordpress
a2enmod rewrite
a2dissite 000-default
service apache2 reload
```

---

## 🧩 Configure MySQL for WordPress

### 5️⃣ Secure and Create MySQL Database

```sh
service mysql start
mysql -u root
```

Inside the MySQL shell:

```sql
CREATE DATABASE wordpress;
CREATE USER wordpress@localhost IDENTIFIED BY '<your-password>';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;
FLUSH PRIVILEGES;
quit
```

> 🔐 **Note**: Replace `<your-password>` with a strong password of your choice.

---

## ⚙️ Configure WordPress

### 6️⃣ Set Database Credentials in WordPress Config

```sh
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/<your-password>/' /srv/www/wordpress/wp-config.php
```

---

## 🌐 Access Your WordPress Site

Open your browser and visit:

```
http://192.168.56.15
```

You will see the **WordPress setup page**.

---

## 📝 Final Steps (Inside Browser)

1. Select your **language**.
2. Enter:
   - **Site Title**
   - **Username**
   - **Password**
   - **Email**
3. Click **Install WordPress**.

You’re done! 🎉

---

## ✅ Final Output

Your WordPress website is now live at:

```
http://192.168.56.15
```

Let me know if you want to automate this setup or add SSL, domain names, or phpMyAdmin!