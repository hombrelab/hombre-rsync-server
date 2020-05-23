# hombre-rsync-server
![Docker Pulls](https://img.shields.io/docker/pulls/hombrelab/hombre-rsync-server) ![Docker Image Version (latest by date)](https://img.shields.io/docker/v/hombrelab/hombre-rsync-server) ![GitHub commit activity](https://img.shields.io/github/last-commit/hombrelab/hombre-rsync-server)  

The [hombre-rsync-server](https://hub.docker.com/repository/docker/hombrelab/hombre-rsync-server) image is based on the [hombre-alpine](https://hub.docker.com/repository/docker/hombrelab/hombre-alpine) image and [Rsync](https://rsync.samba.org/).  
It is a customized Docker image for and by [@Hombrelab](me@hombrelab.com).  

Deployment examples:

Command line
```shell script
docker run \
    --name rsync-server \
    --detach \
    --restart unless-stopped \
    --volume /home/data/rsync-server/rsyncd.conf:/etc/rsyncd.conf \
    --volume /home/hombrelab/Documents/Homelab:/homelab \
    --volume /home/data:/data \
    --volume /etc/localtime:/etc/localtime:ro \
    --publish 873:873 \
    hombrelab/hombre-rsync-server
```

Docker Compose
```yaml
    rsync-server:
      container_name: rsync-server
      restart: unless-stopped
      image: hombrelab/hombre-rsync-server
      volumes:
          - /home/data/rsync-server/rsyncd.conf:/etc/rsyncd.conf
          - /home/hombrelab/Documents/Homelab:/homelab
          - /home/data:/data
          - /etc/localtime:/etc/localtime:ro
      ports:
          - 873:873
```

Example 'rsyncd.conf' config file
```text
[global]
charset = utf-8
max connections = 8
reverse lookup = no

[share]
path = /share
read only = yes
#hosts allow = 192.168.0.0/16
#auth users = *
#secrets file = /etc/rsyncd.secrets
#strict modes = false
```