# 📦 Vagrant VM Setup - Ubuntu 22.04 (Jammy Jellyfish)

This Vagrant configuration sets up a virtual machine using **Ubuntu 22.04 LTS (Jammy Jellyfish)**. It's perfect for modern development and testing environments with the latest long-term support version of Ubuntu.

---

## 📋 Requirements

Ensure the following tools are installed on your host machine:

- [Vagrant](https://www.vagrantup.com/docs/installation)
- [VirtualBox](https://www.virtualbox.org/)

---

## ⚙️ Configuration Details

| Parameter             | Value                            |
|----------------------|----------------------------------|
| **Base Box**         | `ubuntu/jammy64`                 |
| **Box Version**      | `20241002.0.0`                   |
| **OS Version**       | Ubuntu 22.04 LTS                 |
| **Architecture**     | 64-bit                           |
| **Provisioning**     | Not configured (default)         |
| **Networking**       | Not configured (optional)        |
| **Synced Folders**   | Default `/vagrant`               |

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

### ➕ Add Networking

Uncomment or add networking options in the `Vagrantfile`:

```ruby
# config.vm.network "forwarded_port", guest: 80, host: 8080
# config.vm.network "private_network", ip: "192.168.56.10"
```

### ➕ Add Provisioning

Enable provisioning by adding a shell script or other provisioners:

```ruby
config.vm.provision "shell", inline: <<-SHELL
  sudo apt update
  sudo apt install -y apache2
SHELL
```

---

## 🧾 OS Information

```
NAME="Ubuntu"
VERSION="22.04 LTS (Jammy Jellyfish)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 22.04 LTS"
VERSION_ID="22.04"
```

