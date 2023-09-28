cd /d %~dp0
echo Open Visual Studio Code Remote

@REM cd ../learning-dapr-codespace

docker exec learning-dapr-codespace-1 bash /git/clone-all.sh

vscode-remote-workspace-1.bat Terraform