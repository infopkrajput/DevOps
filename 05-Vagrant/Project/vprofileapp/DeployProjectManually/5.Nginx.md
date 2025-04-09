# 🌐 5. NGINX Setup (on `web01`)

## 🔐 SSH into the Nginx VM

```bash
vagrant ssh web01
```

## 👨‍💻 Switch to root user

```bash
sudo -i
```

## 📁 Verify Hosts entry

```bash
cat /etc/hosts
```
> ⚠️ Ensure all required IP and hostname are correctly mapped.

## 🔄 Update OS with latest patches

```bash
apt update
apt upgrade -y
```

## 📥 Install Nginx

```bash
apt install nginx -y
```

## ⚙️ Create Nginx Configuration File

Create config file:

```bash
vi /etc/nginx/sites-available/vproapp
```

Paste the following content:

```nginx
upstream vproapp {
    server app01:8080;
}

server {
    listen 80;
    location / {
        proxy_pass http://vproapp;
    }
}
```

## 🧹 Remove default nginx config

```bash
rm -rf /etc/nginx/sites-enabled/default
```

## 🔗 Create symbolic link for new config

```bash
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp
```

## 🔄 Restart Nginx

```bash
systemctl restart nginx
```

✅ Done! NGINX is now set up to reverse proxy requests to Tomcat on `app01`.

