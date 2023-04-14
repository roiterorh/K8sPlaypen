#!/usr/bin/env bash
set -e
VENV=.venv
ls -1 $VENV &> /dev/null || python3 -m venv $VENV
. $VENV/bin/activate
echo "Venv activated: $(which python)"
pip freeze | grep ansible > /dev/null || pip install ansible 
$VENV/bin/ansible-playbook playbook.yaml --diff 