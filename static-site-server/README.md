


## Static Site Server
Setup a basic linux server and configure it to serve a static site.


Sample solution for [Static Site Server](https://roadmap.sh/projects/static-site-server)
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


### Steps to deploy Static Site Server using rsync

**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd ssh-remote-server-setup
```

👉 **What are we doing here...**

1. Setup nginx on a linux VM.
2. Deploy rsync on both local system and remote server
3. Test if rsync is able to overwrite/copy files to remote server
4. Overwrite the default nginx site with custom site through rsync 
5. Finally, we will create a deployment script to deploy from local to remote server


Lets start.....


✅ **Create VM with http enabled**

1. Create a Linux VM instance in Google Cloud Console (GCP).
2. Allow HTTP traffic (port-80) under Firewall.
3. Once the VM is up and running copy its External IP (this IP will be used to SSH).
4. Create ssh key-pair and setup connection (follow the steps for ssh)
[SSH Remote Server Setup](https://github.com/ashif8984/roadmap-projects/blob/main/ssh-remote-server-setup/README.md)


✅ **Install Rsync and Nginx**

1. Install rsync utility on local machine and remote server

```sh
sudo apt update
sudo apt install rsync
sudo apt install nginx
systemctl status nginx

check default site running
http://your_server_ip

```

Managing nginx process

```sh
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
```


✅ **Test rsync to update the file**

Lets test to copy/overwrite a local file on remote server

1. Create a file in local path: touch file
2. Now copy this file on remote server path using rsync
```sh
rsync -avh file ashifkey@<PUBLIC_IP>:/tmp/file
```
3. If you get error, one system - either local or remote do not have rsync installed.


✅ **Deploy custom site to nginx server**

4. Create a index.html file in local machine with some content in it.
5. Will deploy this index.html in remote machine.
6. First lets add the permission for local user to allow access to the /var/www path
```sh
sudo chown $user:$user -R /var/www/html
```
8. Run the command below to deploy the custom page in nginx 
```sh
rsync -avh index.html <USER>@<SERVER_IP>:/var/www/html/index.nginx-debian.html
```

✅ **Create deployment script**

1. Run the below script passing 2 parameter

```sh
chmod +x deploy.sh
./deploy.sh <FILENAME> <HOSTNAME>

FILENAME - index.html file 
HOSTNAME - IP or hostname of remote server

```
