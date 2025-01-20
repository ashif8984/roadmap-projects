## Dockerized Service
Use GitHub Actions to Deploy a Dockerized Node.js Service


Sample solution for [Dockerized Service](https://roadmap.sh/projects/dockerized-service-deployment)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


### Project Goal

The goal of this project is to dockerize a simple Node.js service and deploy it to a remote server using GitHub Actions. You will also practice secrets management.

### Requirements
There are 4 parts to this project:

Step 1 — Creating a Node.js service
Step 2 — Dockerizing the Node.js service
Step 3 — Setup a remote Linux Server
Step 4 — Deploying the Dockerized Node.js service to a remote server using GitHub Actions

Complete requrements details provided in [Dockerized Service](https://roadmap.sh/projects/dockerized-service-deployment)

### Summary

What we will be doing is -

1. Create a Node JS service with 2 routes - Normal route and Authenticated Route
    - Normal Route : / route - which simply returns Hello, world!
    - Authenticated Route : /secret - protected by Basic Auth
2. Authenticated Route will print "Secret Message" if authentication is sucessful.
3. Will be dockerize the application and create a docker image and run it locally to validate application works fine
4. We will deploy the dockerized application using Github Actions.


✅  **Create a node js webserver with mentioned routes**

1. Create a express server and test its running on port provided.
2. Add both the normal and secret routes.
3. Add the middleware function that will authenticate before requests goes to secret route
4. Refer to the code app.js for code.

✅  **Containerize the application** 

1. Create a dockerfile that contains instruction to build and run the app

```
FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 9000
CMD [ "node", "app.js" ]
```
2. Build the image

```
docker build -t mynodeappwithsecret .
```
3. Run the container

```
docker run --name mynodeappwithsecret -p 9000:9000 -d mynodeappwithsecret 
```

4. Test the application running on the port

```
http://<SERVER_IP>:9000
http://<SERVER_IP>:9000/secret
```

✅  **Deploy using Github Actions**

This is in progress.....

Step 1 — Creating a Node.js service [DONE ✅]\
Step 2 — Dockerizing the Node.js service [DONE ✅]\
Step 3 — Setup a remote Linux Server [DONE ✅]\
Step 4 — Deploying the Dockerized Node.js service to a remote server using GitHub Actions [Not Started ❌]


