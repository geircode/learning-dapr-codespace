#!/bin/sh

pip install virtualenv
virtualenv .venv
.venv\Scripts\activate
pip3 install -U -r "requirements.txt"
