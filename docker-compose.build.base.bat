cd %~dp0

docker swarm init

set DOCKER_LATEST_VERSION_FILE=docker-19.03.4.tgz

REM docker build --no-cache -f Dockerfile.base -t geircodeacr.azurecr.io/learning-dapr-codespace-base .
docker build --progress plain -f Dockerfile.base -t geircodeacr.azurecr.io/learning-dapr-codespace-base .

pause
