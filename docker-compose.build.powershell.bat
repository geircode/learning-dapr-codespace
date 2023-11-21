cd %~dp0

docker swarm init

docker build --progress plain -f Dockerfile.powershell -t geircodeacr.azurecr.io/learning-dapr-codespace-base-powershell .

pause
