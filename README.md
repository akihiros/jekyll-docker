# jekyll-docker

- [1. Overview](#1-overview)
- [Update](#update)
- [2. Usage Instructions](#2-usage-instructions)
- [3. Reference](#3-reference)
  - [3.1. Local Build](#31-local-build)
  - [3.2. Without docker-compose.yml](#32-without-docker-composeyml)
  - [3.3. Push to Docker Hub](#33-push-to-docker-hub)

## 1. Overview

- Sets up a Jekyll environment for the purpose of using GitHub Pages
- Uses the official Ruby Docker image (alpine)
- Prerequisites: Please prepare a Jekyll project
  - Example: [akihiros.github.io](https://github.com/akihiros/akihiros.github.io)

## Update

| date | content | note |
|------|---------|------|
| 2025/5/30 | Replace ruby:alpine-3.4 | |

## 2. Usage Instructions

- Navigate to the Jekyll project folder you want to run locally and execute

```sh
# pull image
sudo docker pull akihiros1207/jekyll-env:latest

# run container
sudo docker run --rm -it -p 4000:4000 -v $(pwd):/jekyll akihiros1207/jekyll-env
```

- Create `docker-compose.yml` in your Jekyll project

```yml
# docker-compose.yml
version: '3.8'
services:
  jekyll:
    image: akihiros1207/jekyll-env
    ports:
      - "4000:4000"
    volumes:
      - .:/jekyll
    stdin_open: true
    tty: true
```

```sh
# accessible at http://0.0.0.0:4000
$ sudo docker-compose up
```

## 3. Reference

### 3.1. Local Build

- Refer to this section if you want to customize and build locally
- Execute in the root directory of this repository

```sh
$ git clone https://github.com/akihiros1207/jekyll-docker.git
$ sudo docker build . -t jekyll-env
```

### 3.2. Without docker-compose.yml

```sh
sudo docker run --rm -it -p 4000:4000 -v $(pwd):/jekyll jekyll-env
```

### 3.3. Push to Docker Hub

```sh
sudo docker build . -t jekyll-env

docker tag jekyll-env akihiros1207/jekyll-env:latest
docker tag jekyll-env akihiros1207/jekyll-env:ruby3.4-alpine

docker push akihiros1207/jekyll-env:latest
docker push akihiros1207/jekyll-env:ruby3.4-alpine
```
