


## Log Archive Tool
A bash script create logs(tar.gz) for a Linux server

Sample solution for [server performance stats](https://roadmap.sh/projects/log-archive-tool)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.

### Steps to run the script in Linux server


**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd log-archive-tool
```


**Make the script executable**

```sh
chmod +x log-archival.sh
```

**Execute the script**

```sh
./log-archival.sh <SOURCE_DIRECTORY> <DESTINATION_DIRECTORY>

SOURCE_DIRECTORY      : [Required] Ex: /var/log
DESTINATION_DIRECTORY : [Optional] Ex: /tmp
```


