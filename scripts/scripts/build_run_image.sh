#!/usr/bin/env bash
# Load configurations
. ./scripts/config.sh

# Delete local exit image.
#docker image rm $(docker image ls)

# Show exist images
#docker images ls

# Build image
docker build --tag=$dockerpath:$version .
docker run -p $hostport:$containerport -d $dockerpath:$version

# Show exist images
#docker images ls

# Run flask app
#docker run -p $hostport:$containerport --name=$appname $dockerpath:$version

# Show exist containers
#docker ps -a

# Test the container
#curl -k http://localhost:6000