cd %~dp0

docker push geircodeacr.azurecr.io/learning-dapr-codespace-base
docker push geircodeacr.azurecr.io/learning-dapr-codespace-base-powershell
docker push geircodeacr.azurecr.io/learning-dapr-codespace-filecontainer:latest

@REM Ikke push container som inneholder PAT
@REM docker push geircodeacr.azurecr.io/learning-dapr-codespace:latest

pause