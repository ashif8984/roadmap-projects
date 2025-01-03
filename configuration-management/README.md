## Configuration Management
Write an Ansible playbook to configure a Linux server


Sample solution for [Configuration Management](https://roadmap.sh/projects/configuration-management)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


## Ansible playbook to configure a Linux server 

### Project Goal
The goal of this project is to introduce you to the basics of configuration management using Ansible. You will write an Ansible playbook to configure a Linux server.

You are required to write an Ansible playbook called setup.yml and create the following roles:

> base — basic server setup (installs utilities, updates the server, installs fail2ban, etc.) \
> nginx — installs and configures nginx \
> app — uploads the given tarball of a static HTML website to the server and unzips it. \
> ssh - adds the given public key to the server

Set up the inventory file inventory.ini to include the server you are going to configure When you run the playbook, it should run the roles above in sequence. You should also assign proper tags to the roles so that you can run only specific roles.

### Example:

**Run all the roles** 
```
ansible-playbook setup.yml
```

**Run only the app role** 
```
ansible-playbook setup.yml --tags "app"
```
---

## Solution

**What we will be doing . . . .**

1. Install ansible on a linux server
2. Create inventory host file
3. Test connectivity(ping-pong) on the host
4. Create role(s) and test the working of the roles
5. Now, create all the roles and setup each roles as required
6. Run all the roles from main playbook file
7. Verify application deployment is successfully.


**Clone the repository**
```
git clone https://github.com/ashif8984/roadmap-projects.git
cd iac_on_digitalocean
```


✅  **Install Ansible on Linux Server**

I have provisioned a Linux Server (debian) on GCP Cloud. However, you can use any other linux or any other cloud / local vm to create one.

1. Run the script - install-ansible.sh to install ansible on the linux host.

```
chmod +x install-ansible.sh
./install-ansible.sh

# verify installation
ansible --version
```

✅  **Create inventory host file for ansible**

The Ansible inventory file defines the hosts and groups of hosts upon which commands, modules, and tasks in a playbook operate

1. Create a host file under /etc directory

```
# if this /etc/ansible is not present create one
sudo mkdir -p /etc/ansible/hosts

vi /etc/ansible/hosts

[hosts]
localhost              ansible_connection=local
```

Note: For this project we have used the same host where ansible is running as our target host, but we can use any other server as our host.

✅  **Test connectivity of the host**

Lets run some ad-hoc ansible commands to test the connectivity of the host from the ansbile server.

```
ansible all -m ping
ansible localhost -m ping
ansible localhost -a "/bin/echo hello"
```
Run each command one by one to test the connectivity. Output will result - success and ping-pong. This means we are all set.

✅  **Create role(s) and test the working of the roles**

Before we jump on actual roles that we'll create, Lets test if we can work with sample role and proceed further

1. Run the below command to create a role

```
mkdir roles
ansible-galaxy init roles/setup
```

2. Out of all the default folders the above cmds, delete all the folders/files except the below

```
rm -rf handlers templates files vars meta 
# Directory structure
roles/setup
      |--defaults/
             |--main.yml
      |--tasks/
             |--main.yml
```

3. Add the below tasks under files

```
# defaults/main.yml
---
url: http://www.google.com/

# tasks/main.yml
---
- name: check url is reachable or not
  uri:
   url: "{{ url }}"
- name: print the {{ url }} is working
  debug:
   msg: "{{ url }} is working and reachble"

```

4. Add the below tasks under root ansible playbook yml file - nginx-deployment.yml

```
# nginx-deployment.yml
---
- name: Playbook to deploy to nginx server
  hosts: all
  become: yes
  roles:
   - role: roles/setup
     tags: setup
     
```
5. Lets run our playbook if the tasks executs successfully

```
ansible-playbook nginx-deployment.yml
```

✅  **Create roles for nginx and app deployment**

1. Create the below roles and keep only below files/folders only

```
ansible-galaxy init roles/app
ansible-galaxy init roles/nginx
ansible-galaxy init roles/ssh

# roles/app directory structure
roles/app
      |--files/
             |--main.yml
      |--tasks/
             |--main.yml

# roles/nginx directory structure
roles/nginx
      |--handlers/
             |--main.yml
      |--tasks/
             |--main.yml

# roles/ssh directory structure
roles/ssh
      |--defaults/
             |--main.yml
      |--tasks/
             |--main.yml

```

2. Now add the contents to each main.yml under each roles. Follow the folders/files as provided in this repository

* roles/setup : Will setup the server and install tools like - git, vim, fail2ban and updates the server.
* roles/nginx : installs and starts the nginx webserver
* roles/app : untar the tar.gz files which contains website files - index.html
* roles/ssh : Copies the ssh public key to target host

3. Now run the playbook to run all the roles in sequence

```
ansible-playbook nginx-deployment.yml
```

### Command Summary

```
# Run the ansible playbook
ansible-playbook nginx-deployment.yml

# Run the ansible playbook - specific role
ansible-playbook nginx-deployment.yml --tags app

# Create a *.tar.gz file
tar -cvf /tmp/app/app.tar.gz index.html

# Ansible ad-hoc commands
ansible all -m ping
ansible localhost -m ping
ansible localhost -a "/bin/echo hello"

# Create role
ansible-galaxy init webserver
```

### References

[Install and configure Nginx using Ansible](https://code-maven.com/install-and-configure-nginx-using-ansible)\
[Upload ssh public key to as authorized_key using Ansible](https://www.cyberciti.biz/faq/how-to-upload-ssh-public-key-to-as-authorized_key-using-ansible/)\
[ansible.builtin.unarchive module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/unarchive_module.html#examples)\
[Ansible roles](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-directory-structure)
