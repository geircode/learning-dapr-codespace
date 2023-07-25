cd %~dp0
docker-compose -f docker-compose.yml build --progress plain --no-cache
pause