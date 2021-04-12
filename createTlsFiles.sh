#!/bin/bash

SUBJ_HOST="pg.jarry.dk"

SUBJ_ROOT="root.jarry.dk"

# steep 1
openssl req -new -x509 -days 365 \
    -nodes -text -out server.crt \
    -keyout server.key \
    -subj "/CN=$SUBJ_HOST"

chmod og-rwx server.key

openssl req -new -nodes -text -out root.csr \
  -keyout root.key \
  -subj "/CN=$SUBJ_ROOT"

chmod og-rwx root.key

openssl x509 -req -in root.csr -text -days 3650 \
  -extfile /etc/pki/tls/openssl.cnf -extensions v3_ca \
  -signkey root.key -out root.crt

openssl req -new -nodes -text -out server.csr \
  -keyout server.key -subj "/CN=$SUBJ_HOST"

chmod og-rwx server.key

openssl x509 -req -in server.csr -text -days 365 \
  -CA root.crt -CAkey root.key -CAcreateserial \
  -out server.crt

cp root.crt ca.crt