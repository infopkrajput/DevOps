# 05-vagrant 

## Introduction

Vagrant is an open-source tool developed by HashiCorp that allows developers to create and configure lightweight, reproducible, and portable virtual environments. It uses a simple command-line client and a single configuration file (called `Vagrantfile`) to manage virtual machines.

Vagrant is mainly used to automate the setup of development environments, ensuring consistency across teams and machines.

--- 

## Installation

### Prerequisites:
- Virtualization software like **VirtualBox**, **VMware**, or **Docker**
- Vagrant installed from [https://www.vagrantup.com/downloads](https://www.vagrantup.com/downloads)

---

## Getting Started

### Initialize a new Vagrant environment
```bash
vagrant init
```
### Or initialize with a specific box

```bash
vagrant init hashicorp/bionic64
```

### Start the VM

```bash
vagrant up
```

### SSH into the VM

```bash
vagrant ssh
```

### Halt the running VM

```bash
vagrant halt
```

### Destroy the VM

```bash
vagrant destroy
```

---

## 

## Example: Basic Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "./data", "/var/www"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
end
```

---

## 

## Common Vagrant Commands

| Command | Description |
|--------|-------------|
| `vagrant init` | Initialize a new Vagrant environment |
| `vagrant up` | Start the virtual machine |
| `vagrant ssh` | SSH into the VM |
| `vagrant halt` | Stop the virtual machine |
| `vagrant destroy` | Remove the VM |
| `vagrant reload` | Restart the VM with updated Vagrantfile |
| `vagrant status` | Check VM status |
| `vagrant box list` | List all installed boxes |
| `vagrant box add <box>` | Add a new box |
| `vagrant global-status` | List all Vagrant environments |
| `vagrant provision` | Run the provisioner again |
| `vagrant plugin list` | List installed plugins |
| `vagrant plugin install <plugin>` | Install a plugin |

---

## 

## Useful Plugins

| Plugin | Description |
|--------|-------------|
| `vagrant-vbguest` | Auto updates VirtualBox Guest Additions |
| `vagrant-disksize` | Allows customizing disk size of the VM |
| `vagrant-triggers` | Add pre/post `vagrant` hook support |
| `vagrant-share` | Share local environment with anyone on the internet |
| `vagrant-cachier` | Caches packages to speed up provisioning |

### Install Example:
```bash
vagrant plugin install vagrant-vbguest
```

---

## 

## Networking Options

- **Port Forwarding:**
  ```ruby
  config.vm.network "forwarded_port", guest: 80, host: 8080
  ```

- **Private Network:**
  ```ruby
  config.vm.network "private_network", ip: "192.168.33.10"
  ```

- **Public Network:**
  ```ruby
  config.vm.network "public_network"
  ```

---

## 

## Synced Folders

Automatically sync a local folder to the guest machine:

```ruby
config.vm.synced_folder "./local", "/home/vagrant/data"
```

---

## 

## Provisioning

You can provision using:

### Shell:
```ruby
config.vm.provision "shell", inline: <<-SHELL
  apt-get update
  apt-get install -y apache2
SHELL
```

### Ansible / Puppet / Chef also supported.

---

## 

## Boxes (Base Images)

Popular Vagrant boxes:
- `hashicorp/bionic64`
- `ubuntu/focal64`
- `centos/7`
- `debian/bullseye64`

Find more boxes at: [https://app.vagrantup.com/boxes/search](https://app.vagrantup.com/boxes/search)

---

## 

## Best Practices

- Always commit your `Vagrantfile` in version control.
- Use environment variables for sensitive configurations.
- Destroy unused machines to free resources.
- Name your VMs and boxes clearly.

---

## 

## Troubleshooting

- ❗ **Vagrant not found?** Add it to your system PATH.
- ❌ **Box download error?** Try `vagrant box remove` and re-add.
- 🔄 **Changes in Vagrantfile not applied?** Run `vagrant reload`.

---

## 

## Resources

- [Official Docs](https://www.vagrantup.com/docs)
- [Vagrant Boxes](https://app.vagrantup.com/boxes/search)
- [GitHub Repo](https://github.com/hashicorp/vagrant)

---

Happy Coding with Vagrant! 🚀
```

---

Let me know if you want this content exported as a `.md` file or if you want to customize it for a particular Vagrant project.