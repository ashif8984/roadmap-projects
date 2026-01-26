## File Integrity Checker
You are required to develop a tool that verifies the integrity of log files to detect tampering. This tool can be used to enhance security measures by using techniques such as file integrity monitoring and hashing to ensure that no unauthorized changes have been made to the log files.
https://roadmap.sh/projects/file-integrity-checker


Sample solution for [File Integrity Checker](https://roadmap.sh/projects/file-integrity-checker)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.



## Commands:

### Create new user
```sh
useradd admin
```

### Add user to root group:
```sh
usermod -aG sudo admin
```

### Login as another user
```sh
su - admin
```


### SSH 
```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-copy-id username@remote_host
cat ~/.ssh/id_ed25519.pub


mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### Firewall - ufw

```sh
# Shows the firewall status and current rules.
sudo ufw status

# Provides more detailed status information, including default policies.
sudo ufw status verbose

# Lists rules with numbers, useful for deleting specific rules.
sudo ufw status numbered

# Activates the firewall. Warning: If connected via SSH, ensure you have an "allow SSH" 
sudo ufw enable

# Deactivates the firewall.
sudo ufw disable

# Reloads the firewall rules without dropping existing connections.
sudo ufw reload

# Resets UFW to its default, inactive state, deleting all rules. 
sudo ufw reset

sudo ufw allow <port>
sudo ufw deny <port>
sudo ufw allow <port>/<protocol>

### Steps to create cryptographic hash
```





✅ Result : 👉 [My Website Link](https://ashif8984.github.io/roadmap-projects/)