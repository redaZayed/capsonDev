#!/usr/bin/env bash

#echo "Remove old virtual environment"
#sudo rm -r venv
#
#echo "Create new virtual environment"
#virtualenv env
#
#echo "Activate new virtual environment"
# cd venv/bin/
#pwd
#echo "-------------------"
#. env/bin/activate
#echo "-------------------"
#
#echo "Activate new virtual environment"
#pip install -r requirements.txt
#
#echo "-------------------"

export FLASK_APP=run.py

#PYENV_HOME=$WORKSPACE/.env/
#virtualenv $PYENV_HOME

virtualenv .env
. .env/bin/activate

pip install -r requirements.txt

echo "Start lint file"
pylint --disable=R,C,W1203,W1202,W0311 run.py