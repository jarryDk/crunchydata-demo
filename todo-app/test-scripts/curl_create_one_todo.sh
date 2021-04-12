#!/bin/bash

curl -D - \
    -H "accept: application/json" \
    -H  "Content-Type: application/json" \
    -d "{\"body\":\"Curl test - body\",\"subject\":\""$(date +"%Y-%m-%dT%H:%M:%S%z")" - Curl test - subject\"}" \
    -X POST "http://console-openshift-console.apps-crc.testing:32284/todos"