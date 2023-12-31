cd /d %~dp0
echo Open Visual Studio Code Remote

docker network create -d overlay --attachable geircode_common_network

docker-compose -f docker-compose.yml up -d

docker run --rm geircode/string_to_hex bash string_to_hex.bash "learning-dapr-codespace-2" > vscode_remote_hex.txt

set /p vscode_remote_hex=<vscode_remote_hex.txt


@REM echo %vscode_remote_hex%
@REM if "%vscode_remote_hex%" == "7b22636f6e7461696e65724e616d65223a222f736c762d776f726b73706163652d31227d" echo Hex_is_correct

code --folder-uri=vscode-remote://attached-container+%vscode_remote_hex%/git
exit /s

@REM pause
