# 📦 Vagrant VM Setup - Ubuntu 14.04 Trusty

This Vagrant configuration sets up a virtual machine using **Ubuntu 14.04 LTS (Trusty Tahr)**. It’s ideal for testing legacy applications or development environments that require older software versions.

---

## 📋 Requirements

Make sure the following tools are installed on your host machine:

- [Vagrant](https://www.vagrantup.com/docs/installation)
- [VirtualBox](https://www.virtualbox.org/)

---

## ⚙️ Configuration Details

| Parameter             | Value                   |
|----------------------|-------------------------|
| **Base Box**         | `ubuntu/trusty64`       |
| **OS Version**       | Ubuntu 14.04.6 LTS      |
| **Architecture**     | 64-bit                  |
| **Provisioning**     | Disabled (default)      |
| **Networking**       | Not configured (edit as needed) |
| **Synced Folders**   | Default `/vagrant`      |

---

## 🚀 Getting Started

### 1️⃣ Clone this repository or create a folder with the provided `Vagrantfile`.

### 2️⃣ Start the virtual machine:

```sh
vagrant up
```

### 3️⃣ SSH into the VM:

```sh
vagrant ssh
```

### 4️⃣ Stop the VM:

```sh
vagrant halt
```

### 5️⃣ Destroy the VM (optional):

```sh
vagrant destroy
```

---

## 🔧 Customization

### ➕ Enable Networking

Uncomment and modify the relevant lines in the `Vagrantfile`:

```ruby
# config.vm.network "forwarded_port", guest: 80, host: 8080
# config.vm.network "private_network", ip: "192.168.33.10"
```

### ➕ Enable Provisioning

Add shell script provisioning (uncomment the block):

```ruby
config.vm.provision "shell", inline: <<-SHELL
  apt-get update
  apt-get install -y apache2
SHELL
```

---

## 🧾 OS Information

```
NAME="Ubuntu"
VERSION="14.04.6 LTS, Trusty Tahr"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 14.04.6 LTS"
VERSION_ID="14.04"
```

---

