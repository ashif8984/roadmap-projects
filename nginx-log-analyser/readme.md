## Nginx Log Analyser
A bash script to analyze logs from the command line.

Sample solution for [Nginx Log Analyser](https://roadmap.sh/projects/nginx-log-analyser)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.

### Steps to run the script in Linux server


**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd nginx-log-analyser
```


**Make the script executable**

```sh
chmod +x log-analyzer.sh
```

**Execute the script**

```sh
./log-analyzer.sh

```

**Sample Output**
```sh
./log-analyzer.sh

Top 5 IP addresses with the most requests:
178.128.94.113  ---> 1087 requests
142.93.136.176  ---> 1087 requests
138.68.248.85  ---> 1087 requests
159.89.185.30  ---> 1086 requests
86.134.118.70  ---> 277 requests


Top 5 most requested paths:
/v1-health  ---> 4560 requests
/  ---> 270 requests
/v1-me  ---> 232 requests
/v1-list-workspaces  ---> 127 requests
/v1-list-timezone-teams  ---> 75 requests


Top 5 most response status codes:
200  --->  5740 requests
404  --->  937 requests
304  --->  621 requests
400  --->  192 requests
"-"  --->  31 requests


Top 5 most user agents:
"DigitalOcean   ---> 4347 requests
"Mozilla/5.0   ---> 2352 requests
"Custom-AsyncHttpClient"   ---> 294 requests
"Go-http-client/1.1"   ---> 194 requests
"curl/7.54.0"   ---> 162 requests
```





