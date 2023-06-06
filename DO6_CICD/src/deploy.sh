#!/bin/bash
if ! scp build/* cicd@10.10.0.2:/usr/local/bin; then
    echo "deploy FAIL!"
    exit 1
fi

echo "deploy OK"
