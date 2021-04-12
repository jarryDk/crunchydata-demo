#!/bin/bash

if [ -f "createToDo.json" ]; then
    rm -f createToDo.json
fi

echo "{" > "createToDo.json"
echo '  "body": "body - ab testing",' >> createToDo.json
echo '  "subject": "'$(date +"%Y-%m-%dT%H:%M:%S%z")' - subject - ab testing"' >> createToDo.json
echo "}" >> createToDo.json

cat createToDo.json

ab -n 100 -c 10 -T "application/json" -p createToDo.json -m POST \
    http://console-openshift-console.apps-crc.testing:32284/todos

if [ -f "createToDo.json" ]; then
    echo "Housekeeping"
    rm -f createToDo.json
fi    