





## Basic Dockerfile
Build a basic Dockerfile to create a Docker image.

Sample solution for [Basic Dockerfile](https://roadmap.sh/projects/basic-dockerfile)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.

### Steps to create Dockerfile and run a docker container

**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd basic-dockerfile
```

**Create a docker image from dockerfile**

```sh
docker build -t ashif8984/captain .
```

**Run a docker container from the image created**

```sh
docker run --rm ashif8984/captain
Hello Captain!
```
This will print - "Hello Captain!" to the console and container will exit(stop)

