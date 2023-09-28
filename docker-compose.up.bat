cd %~dp0

echo GITHUB_TOKEN: %GITHUB_TOKEN%

COPY "%USERPROFILE%\.kube\config" "%~dp0\scripts\secrets\kubeconfig"

git config --global credential.https://dev.azure.com.useHttpPath true

docker swarm init

docker rm -f learning-dapr-codespace-1
docker rm -f learning-dapr-codespace-2

docker-compose -f docker-compose.yml down --remove-orphans

docker network create -d overlay --attachable geircode_common_network

docker-compose -f docker-compose.yml build --progress plain --no-cache learning-dapr-codespace-1

docker-compose -f docker-compose.yml up -d --remove-orphans
REM wait for 1-2 seconds for the container to start
pause
docker exec -it learning-dapr-codespace-1 /bin/bash