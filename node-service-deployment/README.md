## Node.js Service Deployment
Use GitHub Actions to Deploy a Node.js Service to a remote server


Sample solution for [Node.js Service Deployment](https://roadmap.sh/projects/nodejs-service-deployment)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


## Ansible playbook to configure a Linux server 

### Project Goal
The goal of this project is to practice setting up a CI/CD pipeline for a Node.js service using GitHub Actions. You will practice using GitHub Actions for deployment (including Secrets and environment variables), Terraform to provision a server, Ansible to configure the server, and SSH to deploy the application.

### Requirements:

If you haven’t completed the previous projects for Configuration Management and IaC, you should do that first. You will be able to reuse the Ansible and Terraform code from those projects.

You are required to have the following setup:

- Setup a DigitalOcean droplet using Terraform
- Setup the server using Ansible including installing Node.js and npm
- Create a simple Node.js service that just has a / route which returns Hello, world!
- Push the codebase to GitHub repository

Once you have the above setup, you are required to implement the following:

#### Task #1: Manual Ansible Deployment
Setup a role in ansible called app that will connect to the server, clone the repository, install the dependencies, build the application, and start the application.

You should be able to run the playbook using the following command and the application should be up and running on port 80:

ansible-playbook node_service.yml --tags app
You should be able to access the application using the public IP address of the server.

#### Task #2: Automate Deployment using GitHub Actions
Write a GitHub Action workflow that will deploy the application to the server using one of the following methods. You are welcome to try both options, but you are not required to do that. You are also welcome to use any other method to accomplish the same result.

## Solution

**Clone the repository**
```
git clone https://github.com/ashif8984/roadmap-projects.git
cd node-service-deployment
```

> Note: Only completed the Task-1 i.e Manual Ansible Deployment. Task-2 is currently in-progress

### Task-1 Solution

✅  **Create a node js webserver**

1. In your local machine, lets create a simple nodejs webserver on port-9000 and test it
2. Create a app.js file with below content and run it as-

```
# app.js

const http = require('http');
const port = 9000;


http.createServer(function (req, res) {
  res.end('<h1>This is a Node js server</h1>');
}).listen(port, () => {
    console.log(`Server running at port = ${port}`);
  }); 

# Run it

npm init
node app.js
```
3. Open the browser and type - http://localhost:9000. Make sure port-9000 is allowed in Firewall rules in server or EC2/VM instance.

✅  **Create an Ansible playbook to run the webserver on remote VM**


1. Create a playbook file at the root with following content-

```
---
- name: Playbook to deploy a node server
  hosts: all
  become: yes
  gather_facts: no
  vars:
    git_repo_url: https://github.com/ashif8984/roadmap-projects.git
    deployment_path: /home/ashifkey/app-github/node-service-deployment/app
    repo_branch: main

  roles:
   - role: roles/app
     tags: app


```

2. Create a role with name - app and add the contents under roles/app/task/main.yml

```

---
- name: Clone the code repository
  git:
    repo: "{{ git_repo_url }}"
    version: "{{ repo_branch }}"
    dest: /home/ashifkey/app-github
    accept_hostkey: yes

- name: Update apt cache
  apt:
    update_cache: yes

- name: Install Node.js dependencies
  apt:
    name: "{{ item }}"
    state: present
  loop:
    - curl
    - software-properties-common
    - build-essential

- name: Install Node.js
  apt:
    name: nodejs
    state: present

- name: Install packages based on package.json using the npm
  npm:
    path: "{{ deployment_path }}"

- name: Start the application 
  command: node app.js
  args:
    chdir: "{{ deployment_path }}"
  async: 1000                 
  poll: 0 


```

3. Make sure you create hosts file under the default path

```
# /etc/ansible/hosts

[hosts]
localhost              ansible_connection=local
```

4. Run the playbook file 

```
ansible-playbook node-playbook.yml
```

5. This will start the webserver on port-9000 as mentioned in the app.js. Again open browser to validate the application running

```
http:\\<SERVER_IP>:9000
```

### Task-2 Solution : In-Progress ⚠️