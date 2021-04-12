#!/bin/bash

SLEEP_TIME=.5

for i in {1..1000}
do
    echo ""    
    echo ""
    echo "----------------------------------------- "
    echo "- Getting ready to create no $i of 1000 todos"
    echo ""
    curl -D - \
        -H "accept: application/json" \
        -H  "Content-Type: application/json" \
        -d "{\"body\":\"Curl test - body\",\"subject\":\""$(date +"%Y-%m-%dT%H:%M:%S%z")" - Curl test - subject\"}" \
        -X POST "http://console-openshift-console.apps-crc.testing:32284/todos"
    sleep $SLEEP_TIME
done 

echo "Done creating 1000 todos" 