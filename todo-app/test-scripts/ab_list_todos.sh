#!/bin/bash

ab -n 2500 -c 5 -T "application/json" \
    http://console-openshift-console.apps-crc.testing:32284/todos