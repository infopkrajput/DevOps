## 2 Docker Architecture

Docker is built on a client-server architecture and consists of the following components:

- **Docker Engine**: The core service that runs Docker. It provides the environment to build and run containers.

- **Docker Daemon (`dockerd`)**: This is the background service running on the host system. It listens to Docker API requests and manages Docker objects like images, containers, networks, and volumes.

- **Docker Client (`docker`)**: A command-line interface (CLI) tool used to send commands to the Docker daemon. The client communicates with the daemon using REST APIs.

- **Docker Registries**: Storage and distribution systems for Docker images. The default public registry is [Docker Hub](https://hub.docker.com). Private registries can also be used.

- **Images and Containers**:
  - **Image**: A read-only template with instructions to create a Docker container. For example, an image might contain an Ubuntu OS with Apache installed.
  - **Container**: A runnable instance of an image. Containers are isolated environments that run your applications.

### Diagrammatic View:

```
[ Docker Client ] <---> [ Docker Daemon (dockerd) ] <---> [ Images | Containers | Volumes | Networks ]
                                           |
                                           v
                                  [ Docker Registry ]
```
