#!/bin/bash
set -e

# Create salt-api user
if [[ ! `getent passwd $API_USER_NAME` ]]; then
    salt-call --local user.add $API_USER_NAME
fi
echo "$API_USER_NAME:$API_USER_PASS" | chpasswd

# Exec
/usr/bin/salt-master &
/usr/bin/salt-api