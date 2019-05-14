#! /bin/bash

apt update && apt install -y python3-pip
pip3 install requests
chmod +x ./acceptance-tests.py
chmod +x ./run-acceptance-tests.sh
chmod +x ./unit-tests.py
