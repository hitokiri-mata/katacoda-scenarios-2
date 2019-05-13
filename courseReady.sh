#! /bin/bash

echo "Preparing environment - this can take a few mins"

while `command -v python3`; do
    echo "waiting"
    sleep 1
done