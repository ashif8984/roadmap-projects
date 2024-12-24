


## SSH Remote Server Setup
Setup a basic remote linux server and configure it to allow SSH.


Sample solution for [SSH Remote Server Setup](https://roadmap.sh/projects/ssh-remote-server-setup)
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


### Steps to ssh into a Linux server

**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd ssh-remote-server-setup
```


✅ **Create VM and SSH key pair**
1. Create a Linux VM instance in Google Cloud Console (GCP).
2. Once the VM is up and running copy its External IP (this IP will be used to SSH).

3. Create a ssh key pair in your local machine using ssh-keygen command

```sh
ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USERNAME
or 
ssh-keygen -t rsa
```
4. This will generate a public key(id_rsa.pub) and private key(id_rsa).
5. Private key are stored within the system and public key are copied over to the server.
6. Note down the path of the ssh key which is under : ~/.ssh


✅ **Add the public key to the VM instance**

1. Under GCP console, goto Compute engine and then goto Metadata under setting.
2. On the SSH Key tab, click on Edit and then Add item
3. Under the box, paste the public key (id_rsa.pub) generated in above step.
4. Note, do not copy the private key, copy only the ssh public key.
5. Click on save


✅ **Connect to the VM**

1. Open any terminal of your choice and enter the following command:

```sh
ssh -i $HOME/.ssh/id_rsa <USERNAME>@<PUBLIC_IP>

```
2. The above command will connect to the VM instance
3. We can also set the ~/.ssh/config file to allow ssh to the server using the following command.

```sh
ssh <alias>
```

4. Create a file : vi ~/.ssh/config
7. Add the below contents (change IP,hostname and user)

```sh                                                                                                           
Host test-vm
    HostName <PUBLIC_IP_OF_VM>
    User <USERNAME>
    IdentityFile ~/.ssh/id_rsa
```
5. Now, run the below command to connect to the server

```sh                                                                                                           
ssh test-vm
```
