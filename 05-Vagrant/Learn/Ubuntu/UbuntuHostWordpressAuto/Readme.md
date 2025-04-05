Sure Pushpendra! Here's an **auto-host WordPress setup using Vagrant + Ubuntu (Jammy) + Apache + MySQL + PHP**, where everything gets configured **automatically** (just like your CentOS example). The VM will be accessible via `http://192.168.56.16`.

---

### 📁 Auto Host WordPress with Vagrant + Ubuntu

Create this `Vagrantfile`:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.box_version = "20241002.0.0"

  config.vm.network "private_network", ip: "192.168.56.16"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    # Elevate to root
    sudo -i

    # Update and install required packages
    apt update
    apt install apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip unzip curl -y

    # Create WordPress directory
    mkdir -p /srv/www
    chown www-data: /srv/www

    # Download and extract WordPress
    curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

    # Setup Apache virtual host
    cat <<EOF > /etc/apache2/sites-available/wordpress.conf
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
EOF

    # Enable the site and rewrite module
    a2ensite wordpress
    a2enmod rewrite
    a2dissite 000-default
    service apache2 reload

    # Start MySQL and create DB + user
    service mysql start

    mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE wordpress;
CREATE USER wordpress@localhost IDENTIFIED BY 'pass@123';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@localhost;
FLUSH PRIVILEGES;
MYSQL_SCRIPT

    # Configure wp-config.php
    sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
    sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
    sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
    sudo -u www-data sed -i 's/password_here/pass@123/' /srv/www/wordpress/wp-config.php

    echo "✅ WordPress installation completed successfully!"
  SHELL
end
```

---

### 🖥 Access WordPress

After running:

```bash
vagrant up
```

Open your browser and go to:

```
http://192.168.56.16
```

You’ll land on the WordPress setup page.

---