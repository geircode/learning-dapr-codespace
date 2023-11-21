cd %~dp0

docker pull geircodeacr.azurecr.io/learning-dapr-codespace-base:latest
docker pull geircodeacr.azurecr.io/learning-dapr-codespace-base-powershell:latest
docker pull geircodeacr.azurecr.io/learning-dapr-codespace-filecontainer:latest

@REM Ikke push container som inneholder PAT
@REM docker push geircodeacr.azurecr.io/learning-dapr-codespace:latest

pause