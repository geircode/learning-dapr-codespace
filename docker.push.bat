cd %~dp0

docker push geircodeacr.azurecr.io/learning-dapr-base
docker push geircodeacr.azurecr.io/learning-dapr-base-powershell
docker push geircodeacr.azurecr.io/learning-dapr-filecontainer:latest

@REM Ikke push container som inneholder PAT
@REM docker push geircodeacr.azurecr.io/learning-dapr:latest

pause