#!/bin/bash
# Install Docker
apt-get update
apt-get install -y docker.io



#Delete old images

docker rm -f $(docker ps -aq)



# Pull Docker image from registry
docker pull nginx

# Run Docker container
docker run -d -p 80:80 nginx
