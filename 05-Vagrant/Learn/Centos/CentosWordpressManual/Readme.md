## 🚀 Manually Host WordPress on CentOS Stream 9

Assuming you already have a CentOS VM up and running via this Vagrantfile:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "centos/stream9"
  config.vm.box_version = "20250310.0"
  
  config.vm.network "private_network", ip: "192.168.56.17"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
end
```

---

## 📥 Step-by-Step Manual Hosting

### 1️⃣ SSH into your VM

```bash
vagrant ssh
```

Then switch to root:

```bash
sudo -i
```

---

### 2️⃣ Install Apache, PHP, and MariaDB (MySQL)

```bash
dnf install httpd mariadb-server php php-mysqlnd php-fpm php-json php-mbstring php-xml php-curl php-gd php-intl php-zip wget tar -y
```

Start and enable services:

```bash
systemctl enable --now httpd mariadb
```

---

### 3️⃣ Secure MySQL (Optional)

```bash
mysql_secure_installation
```

Follow prompts to set root password and remove test data.

---

### 4️⃣ Create WordPress Database

```bash
mysql -u root -p
```

Inside the MySQL prompt:

```sql
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'pass@123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

---

### 5️⃣ Download & Extract WordPress

```bash
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm -f latest.tar.gz
chown -R apache:apache wordpress
```

---

### 6️⃣ Configure Apache Virtual Host

Create a new file:

```bash
nano /etc/httpd/conf.d/wordpress.conf
```

Paste this:

```apache
<VirtualHost *:80>
    ServerName wordpress.local
    DocumentRoot /var/www/html/wordpress

    <Directory /var/www/html/wordpress>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

---

### 7️⃣ Set Up wp-config.php

```bash
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/wordpress/" wp-config.php
sed -i "s/password_here/pass@123/" wp-config.php
```

---

### 8️⃣ Enable Required Apache Modules and Restart

```bash
setsebool -P httpd_can_network_connect_db 1
systemctl restart httpd
```

---

### 9️⃣ Access WordPress

On your host machine, open:

```
http://192.168.56.17
```

🎉 You’ll see the WordPress setup screen!

---

### ✅ Final Notes

- You can add `192.168.56.17 wordpress.local` to your host file for a custom domain.
- Default WordPress login: You’ll create it during setup.
- You can access MySQL anytime using `mysql -u root -p`

---