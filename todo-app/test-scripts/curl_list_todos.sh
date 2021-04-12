#!/bin/bash

curl -I \
    -H  "accept: application/json" \
    "http://console-openshift-console.apps-crc.testing:32284/todos?from=0&limit=2"