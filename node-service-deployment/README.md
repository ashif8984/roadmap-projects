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



### References

[Install and configure Nginx using Ansible](https://code-maven.com/install-and-configure-nginx-using-ansible)\
[Upload ssh public key to as authorized_key using Ansible](https://www.cyberciti.biz/faq/how-to-upload-ssh-public-key-to-as-authorized_key-using-ansible/)\
[ansible.builtin.unarchive module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/unarchive_module.html#examples)\
[Ansible roles](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#role-directory-structure)
