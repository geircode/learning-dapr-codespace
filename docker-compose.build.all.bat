cd %~dp0

docker swarm init

COPY "%USERPROFILE%\.kube\config" "%~dp0\scripts\secrets\kubeconfig"

set DOCKER_LATEST_VERSION_FILE=docker-19.03.4.tgz

docker-compose -f filecontainer/docker-compose.yml build --progress plain

REM docker build --no-cache -f Dockerfile.base -t geircodeacr.azurecr.io/learning-dapr-codespace-base .
docker build --progress plain -f Dockerfile.base -t geircodeacr.azurecr.io/learning-dapr-codespace-base .

@REM docker build --progress plain -f Dockerfile.powershell -t geircodeacr.azurecr.io/learning-dapr-codespace-base-powershell .

docker-compose -f docker-compose.yml build --progress plain
pause
