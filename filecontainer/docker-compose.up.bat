cd %~dp0
docker rm -f learning-dapr-codespace-filecontainer-1
docker-compose -f docker-compose.yml down --remove-orphans
docker-compose -f docker-compose.yml build --progress plain --no-cache
docker-compose -f docker-compose.yml up --build --remove-orphans
docker exec -it learning-dapr-codespace-filecontainer-1 /bin/sh
pause
