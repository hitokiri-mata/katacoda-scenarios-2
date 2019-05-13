#! /bin/bash

echo "Preparing environment - this can take a few mins"

EXISTS="1"
while [ "$EXISTS" == "1" ]; do
    command -v python3 > /dev/null
    EXISTS=$?
    echo "waiting"
    sleep 1
done