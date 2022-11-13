#!/bin/sh
set -euo pipefail

# Create user
if ! getent passwd "sshtun" >/dev/null; then
    # Create user and set password
    echo "Creating user sshtun"
    adduser -D -s /bin/sh -u 1000 sshtun
    usermod -p "*" sshtun
fi

# Setup client key
mkdir -p "/home/sshtun/.ssh"
echo "$CLIENT_SECKEY" > "/home/sshtun/.ssh/key"
chown -R sshtun "/home/sshtun/.ssh"
chmod -R u=rwX,g=,o= "/home/sshtun/.ssh"

# Setup server key
echo "[$SERVER_IP]:$SERVER_PORT $SERVER_PUBKEY" > "/home/sshtun/.ssh/known_hosts"
chown -R sshtun "/home/sshtun/.ssh"
chmod -R u=rwX,g=,o= "/home/sshtun/.ssh"

# Become ssh
exec su sshtun <<EOF
    exec ssh -v -N -R "$SERVER_FORWARD" -i "/home/sshtun/.ssh/key" -p "$SERVER_PORT" "sshtun@$SERVER_IP"
EOF
