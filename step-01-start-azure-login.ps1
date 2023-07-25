# Hvorfor Powershell for å kjøre az kommandoer? 
# Fordi bat script ikke fungerer med az cli

# [System.Environment]::SetEnvironmentVariable('PYTHON_INSTALL_LOC', 'tcp://docker.artofshell.com:2376', [System.EnvironmentVariableTarget]::User)

cmd.exe /c az login --use-device-code 

# cmd.exe /c pause

Write-Host Login acr geircodeacr.azurecr.io ...
cmd.exe /c az acr login --subscription 7ad19e4e-87b7-4da8-828f-e77235d1f895 --name geircodeacr

cmd.exe /c pause