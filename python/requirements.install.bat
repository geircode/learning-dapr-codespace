cd %~dp0
pip install virtualenv
virtualenv .venv
call .venv\Scripts\activate
which python
which pip3
python --version
pip install -U -r "%~dp0requirements.txt"
pause
