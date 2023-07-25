cd /d %~dp0
echo Open Visual Studio Code Remote

@REM cd ../learning-dapr

docker exec learning-dapr-1 bash /git/clone-all.sh

vscode-remote-workspace-1.bat Terraform