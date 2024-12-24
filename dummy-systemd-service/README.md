


## Dummy Systemd Service
Create a long-running systemd service that logs to a file.


Sample solution for [Dummy Systemd Service](https://roadmap.sh/projects/dummy-systemd-service)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


### Steps to setup and configure systemd service

**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd dummy-systemd-service
```

✅ **Create a dummy script that runs as BG process**

1. This script only prints a msg to console every 10s
```sh
chmod +x dummy.sh
dummy.sh
```

✅ **Create a custom systemd service**

**What is systemd service**

> A systemd service is defined in a unit file (a unit is a representation of a service and system resources such as devices, sockets, mount points, etc.). Custom service unit files should be stored in the /etc/systemd/system/ directory and must have an .service extension. For example, a custom test-app service uses /etc/systemd/system/test-app.service unit file


> To run an application or program or script as a service under systemd, you can create a new systemd service as follows. Start by creating the service unit file named dummy.service under /etc/systemd/system/:

```sh
vi /etc/systemd/system/dummy.service

[Unit]
Description= Dummy Script (dummy.sh) running at the bg as bg process
After=network.target

[Service]
User=ashifkey
Group=ashifkey
WorkingDirectory=/home/ashifkey/
Environment="PATH=/home/ashifkey/"
ExecStart=/home/ashifkey/dummy.sh


[Install]
WantedBy=multi-user.target
```
✅ **Manage custom systemd service**

1. Essentially you need only few commands to manage the service you just created but there are other command too, which is optionally looked at-

```sh

# Start/activate the service
sudo systemctl start dummy.service

# Stop the service
sudo systemctl stop dummy.service

# Status of the service
sudo systemctl status dummy.service

# Restart the service
sudo systemctl restart dummy.service

# Enable the service to start at system boot
sudo systemctl enable dummy.service
sudo systemctl is-enabled dummy.service

# Disable/de-activate the service
sudo systemctl disable dummy.service
sudo systemctl is-disabled dummy.service

```

🔗 References for Netdata 

[How to Create a Systemd Service in Linux](https://www.tecmint.com/create-systemd-service-linux/) \


