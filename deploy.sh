set -e
VENV=.venv
ls -1 $VENV > /dev/null || python3 -m venv $VENV
source $VENV/bin/activate
echo "Venv activated: $(which python)"
pip freeze | grep ansible || pip install ansible
$VENV/bin/ansible-playbook playbook.yaml --diff 