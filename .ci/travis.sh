#!/bin/bash -e

if [[ "$(uname -s)" == 'Darwin' ]]; then
    brew update
    brew install python$PY3
    pip$PY3 install -r dev-requirements.txt
    pip$PY3 install coveralls
else
    pip install -r dev-requirements.txt
    pip install coveralls
fi

echo NoHostAuthenticationForLocalhost yes >> ~/.ssh/config
echo StrictHostKeyChecking no >> ~/.ssh/config
ssh-keygen -q -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
