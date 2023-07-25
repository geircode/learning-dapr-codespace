cd %~dp0

docker pull geircodeacr.azurecr.io/learning-dapr-base:latest
docker pull geircodeacr.azurecr.io/learning-dapr-base-powershell:latest
docker pull geircodeacr.azurecr.io/learning-dapr-filecontainer:latest

@REM Ikke push container som inneholder PAT
@REM docker push geircodeacr.azurecr.io/learning-dapr:latest

pause