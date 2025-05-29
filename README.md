# jekyll-docker

- [1. Overview](#1-overview)
- [2. Update](#2-update)
- [3. Usage Instructions](#3-usage-instructions)
- [4. Reference](#4-reference)
  - [4.1. Local Build](#41-local-build)
  - [4.2. Without docker-compose.yml](#42-without-docker-composeyml)
  - [4.3. Push to Docker Hub](#43-push-to-docker-hub)

## 1. Overview

- Sets up a Jekyll environment for the purpose of using GitHub Pages
- Uses the official Ruby Docker image (alpine)
- Prerequisites: Please prepare a Jekyll project
  - Example: [akihiros.github.io](https://github.com/akihiros/akihiros.github.io)

## 2. Update

| date | content | note |
|------|---------|------|
| 2025/5/30 | Replace ruby:alpine-3.4 | |

## 3. Usage Instructions

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

## 4. Reference

### 4.1. Local Build

- Refer to this section if you want to customize and build locally
- Execute in the root directory of this repository

```sh
$ git clone https://github.com/akihiros1207/jekyll-docker.git
$ sudo docker build . -t jekyll-env
```

### 4.2. Without docker-compose.yml

```sh
sudo docker run --rm -it -p 4000:4000 -v $(pwd):/jekyll jekyll-env
```

### 4.3. Push to Docker Hub

```sh
sudo docker build . -t jekyll-env

docker tag jekyll-env akihiros1207/jekyll-env:latest
docker tag jekyll-env akihiros1207/jekyll-env:ruby3.4-alpine

docker push akihiros1207/jekyll-env:latest
docker push akihiros1207/jekyll-env:ruby3.4-alpine
```
