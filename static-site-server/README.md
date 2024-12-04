


rsync -a ~/dir1 username@remote_host:destination_directory


rsync -a README.md ashifkey@34.68.123.199:/tmp




sudo mkdir -p /var/www/ashif/html
sudo chown -R $USER:$USER /var/www/ashif/html
sudo chmod -R 755 /var/www/ashif

sudo nano /var/www/ashif/html/index.html


<html>
    <head>
        <title>Welcome to ashif!</title>
    </head>
    <body>
        <h1>Success!  The ashif server block is working!</h1>
    </body>
</html>


sudo nano /etc/nginx/sites-available/ashif

server {
        listen 80;
        listen [::]:80;

        root /var/www/ashif/html;
        index index.html index.htm index.nginx-debian.html;

        server_name ashif www.ashif;

        location / {
                try_files $uri $uri/ =404;
        }
}


sudo ln -s /etc/nginx/sites-available/ashif /etc/nginx/sites-enabled/


sudo nginx -t

sudo systemctl restart nginx

location /var/www/ashif/html/ {
       index index.html; 
}