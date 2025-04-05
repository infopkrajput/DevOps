Absolutely Pushpendra! Here's the **automated version** of your **CentOS + WordPress + Apache + MySQL setup** using Vagrant — everything is done via provisioning script so you don’t have to manually run commands. 🔥

---

## ✅ Auto Host WordPress on CentOS Stream 9 using Vagrant

### 📄 `Vagrantfile`

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "centos/stream9"
  config.vm.box_version = "20250310.0"
  
  config.vm.network "private_network", ip: "192.168.56.18"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo -i

    # Install Apache, PHP, and MariaDB
    dnf install httpd mariadb-server php php-mysqlnd php-fpm php-json php-mbstring php-xml php-curl php-gd php-intl php-zip wget tar -y

    systemctl enable --now httpd mariadb

    # Set up MariaDB database and user for WordPress
    mysql -u root <<-MYSQL_SCRIPT
    CREATE DATABASE wordpress;
    CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'pass@123';
    GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
    FLUSH PRIVILEGES;
    MYSQL_SCRIPT

    # Download and set up WordPress
    cd /var/www/html
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    rm -f latest.tar.gz
    chown -R apache:apache wordpress

    # Create Apache Virtual Host
    cat <<EOL > /etc/httpd/conf.d/wordpress.conf
    <VirtualHost *:80>
        DocumentRoot /var/www/html/wordpress
        <Directory /var/www/html/wordpress>
            AllowOverride All
            Require all granted
        </Directory>
    </VirtualHost>
    EOL

    # Configure WordPress
    cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
    sed -i 's/database_name_here/wordpress/' /var/www/html/wordpress/wp-config.php
    sed -i 's/username_here/wordpress/' /var/www/html/wordpress/wp-config.php
    sed -i 's/password_here/pass@123/' /var/www/html/wordpress/wp-config.php
    chown apache:apache /var/www/html/wordpress/wp-config.php

    # Restart Apache
    setsebool -P httpd_can_network_connect_db 1
    systemctl restart httpd

    echo "✅ WordPress setup completed at http://192.168.56.18"
  SHELL
end
```

---

## 🚀 How to Use

### 1️⃣ Run the VM:

```bash
vagrant up
```

This will:

- Install Apache, PHP, MariaDB
- Download WordPress
- Set up the database and user
- Configure Apache
- Host the WordPress site

---

### 2️⃣ Open in Browser

```
http://192.168.56.18
```

You'll see the **WordPress setup screen** ready to complete the installation! 🎉

---
