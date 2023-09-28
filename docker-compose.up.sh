#!/bin/bash
BASEDIR=$(dirname "$0")
echo "$BASEDIR"
cd $BASEDIR

docker swarm init
git config --global credential.https://dev.azure.com.useHttpPath true

docker rm -f learning-dapr-codespace-1
docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable geircode_common_network

# docker-compose -f docker-compose.yml build --progress plain --no-cache

docker-compose -f docker-compose.yml up -d --remove-orphans
# wait for a few seconds for the container to start
echo sleeping a few sec
sleep 2
# open http://localhost:8428/metrics in a browser

echo "Opening a terminal to the Container..."
docker exec -it learning-dapr-codespace-1 /bin/bash
# ================================================= #

## ## Troubleshooting ## ##

# # Test connection
# curl -v http://learning-dapr-codespace:8428/metrics

# echo "Opening a terminal to the Container..."
# docker exec -it learning-dapr-codespace-1 /bin/bash

echo "### docker logs learning-dapr-codespace-1"
docker logs learning-dapr-codespace-1