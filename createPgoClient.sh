#!/bin/bash

export PGO_OPERATOR_NAMESPACE=pgo

curl https://raw.githubusercontent.com/CrunchyData/postgres-operator/v4.6.2/deploy/install-bootstrap-creds.sh > install-bootstrap-creds.sh
curl https://raw.githubusercontent.com/CrunchyData/postgres-operator/v4.6.2/installers/kubectl/client-setup.sh > client-setup.sh

chmod +x install-bootstrap-creds.sh client-setup.sh

echo "Create user ..."
PGO_CMD=oc ./install-bootstrap-creds.sh

echo "Setup pgp with user ..."
PGO_CMD=oc ./client-setup.sh