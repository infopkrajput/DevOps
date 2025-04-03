# 03-VM-Setup-Vagrant

## Introduction
Virtualization uses software called hypervisors to create multiple virtual computers (known as Virtual Machines or VMs) on a single physical machine. These virtual machines can access all the parts of the physical machine, including the processors, memory, and storage.

Each virtual machine runs its own operating system and functions like a completely separate machine—even though it shares the resources of one physical computer.

## Terminologies

- **Host OS**: The main operating system that runs on your computer. It manages the hardware and provides a platform for other software to run.
- **Guest OS**: An operating system that runs inside a virtual machine. It's like having a second computer inside your main computer.
- **VM (Virtual Machine)**: A software-based computer that runs inside your real computer. It behaves like a separate physical computer.
- **Snapshot**: A saved state of a virtual machine at a specific point in time. It's like taking a picture of your VM's current state, so you can return to it later if needed.
- **Hypervisor**: A software layer that allows multiple virtual machines to run on a single physical computer. It manages the resources and ensures each VM operates independently.

## Types of Hypervisors
There are two main types of hypervisors:

### Type 1 (Bare-Metal) Hypervisor
- Runs directly on the physical hardware of the host machine.
- Does not require a host operating system.
- Used in enterprise environments for better performance and efficiency.
- **Examples**: VMware ESXi, Microsoft Hyper-V, Xen.

### Type 2 (Hosted) Hypervisor
- Runs on top of a host operating system.
- Relies on the host OS to manage hardware resources.
- More common for personal use, development, and learning purposes.
- **Examples**: VMware Workstation, Oracle VirtualBox, Parallels Desktop.

## Why Use a Type 2 Hypervisor?
Since we are learning virtualization, we will use a **Type 2 Hypervisor**. It allows us to create and manage virtual machines easily without modifying the host operating system. It is ideal for:

- Running multiple operating systems on a single computer for testing and development.
- Learning about different OS environments without needing separate physical machines.
- Taking snapshots to restore previous states if something goes wrong.

Popular choices include **Oracle VirtualBox** and **VMware Workstation** for a beginner-friendly experience.


# Installing Virtual Machines
There are two ways to install virtual machines:

### 1. Manually
We can manually install VMs in hypervisor software like VirtualBox, VMware Workstation, etc.

#### Manual Installation Steps:
1. **Download Linux ISO:**
   - Visit the official website of the Linux distribution you want to install (e.g., Ubuntu, Fedora, Debian).
   - Download the ISO file.
2. **Install a Hypervisor:**
   - VirtualBox: Download and install.
   - VMware Workstation Player: Download and install.
3. **Create a Virtual Machine:**
   - Open the hypervisor software.
   - Click `New` to create a virtual machine.
   - Configure the following:
     - **Name and OS Type**: Set the name and choose the OS type (e.g., Ubuntu/Linux).
     - **Memory**: Allocate at least 2 GB (2048 MB) or more based on your system's capacity.
     - **Disk**: Create a new virtual hard disk (e.g., 20 GB or more).
4. **Attach the Linux ISO:**
   - Go to the virtual machine settings.
   - Under Storage, attach the downloaded Linux ISO file as a CD/DVD drive.
5. **Start the VM:**
   - Boot the virtual machine.
   - Follow the Linux installation steps:
     - Select the language.
     - Partition the disk (use guided or manual partitioning).
     - Set up a username and password.
     - Complete the installation.
6. **Reboot the VM:**
   - Once installed, reboot the VM and remove the ISO file.

### 2. Automatically
To install Linux automatically in hypervisor software, we can use some tools like:

| Tool       | Suitable For            | Primary Use Case                 |
|-----------|------------------------|----------------------------------|
| Preseed   | Debian/Ubuntu          | Unattended OS installation       |
| Kickstart | Red Hat/Fedora/CentOS  | Automated OS provisioning       |
| Cloud-Init | Cloud environments     | VM configuration                |
| AutoYaST  | SUSE/OpenSUSE          | Unattended OS installation       |
| Ansible   | All distributions      | Post-install configuration       |
| Cobbler   | Network-based installs | PXE boot server                 |
| FAI       | Debian/Ubuntu          | Large-scale deployments         |
| MAAS      | Bare-metal servers     | Data center provisioning        |
| Packer    | VM image creation      | Reproducible images             |
| Terraform | Infrastructure as Code | Automated provisioning          |
| Vagrant   | Dev/Test environments  | Managing virtual environments   |

We will use **Vagrant** for managing Linux environments. Although its primary focus is slightly different, Vagrant is not typically used for automating the initial installation of Linux, but rather for provisioning and managing virtualized environments on top of existing Linux installations.

### Using Vagrant
1. **Install Vagrant:**
   - [Download](https://developer.hashicorp.com/vagrant/install?product_intent=vagrant) and install Vagrant for your platform.
2. **Initialize a Vagrant Project:**
   - There are many VMs available at [`portal.cloud.hashicorp.com`](https://portal.cloud.hashicorp.com/vagrant/discover).
   - Choose a VM and initialize a Vagrant project:
     ```sh
     vagrant init ubuntu/bionic64
     ```
3. **Start the VM:**
   - Run:
     ```sh
     vagrant up
     ```
   - This will:
     - Download the base box (if not already available).
     - Create a virtual machine.
4. **Connect to the VM:**
   - Use SSH to log in:
     ```sh
     vagrant ssh
     ```
5. **Shut Down the VM:**
   - Exit from the VM and use:
     ```sh
     vagrant halt
     ```
6. **Delete the VM:**
   - Shutdown the VM and delete it:
     ```sh
     vagrant destroy
     ```
7. **Check VM Status:**
   - To check if the VM is running:
     ```sh
     vagrant status
     ```
   - To check the status of all VMs:
     ```sh
     vagrant global-status
     ```

### Vagrant Cheat Sheet
- `vagrant init <box_name>` - Initialize a Vagrant environment
- `vagrant up` - Start the VM
- `vagrant ssh` - SSH into the VM
- `vagrant halt` - Stop the VM
- `vagrant destroy` - Remove the VM
- `vagrant status` - Check VM status
- `vagrant global-status` - List all running VMs

By using Vagrant, we can efficiently manage virtualized Linux environments for development and testing.

**Vagrant [cheat sheet](https://gist.github.com/infopkrajput/9f2e41203c2a339b850964e39f875d8e)**
