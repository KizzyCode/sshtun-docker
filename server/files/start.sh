#!/bin/sh
set -euo pipefail

# Create user
if ! getent passwd "sshtun" >/dev/null; then
    # Create user and set password
    echo "Creating user sshtun"
    adduser -D -s /sbin/nologin -u 1000 sshtun
    usermod -p "*" sshtun
fi

# Setup client public keys
mkdir -p "/home/sshtun/.ssh"
echo "$CLIENT_PUBKEYS" > "/home/sshtun/.ssh/authorized_keys"
chown -R sshtun "/home/sshtun/.ssh"
chmod -R u=rwX,g=,o= "/home/sshtun/.ssh"

# Setup server key
echo "$SERVER_SECKEY" > "/etc/ssh/ssh_host_key"
chown root "/etc/ssh/ssh_host_key"
chmod u=rw,g=,o= "/etc/ssh/ssh_host_key"

# Become sshd
exec /usr/sbin/sshd -D -e -f "/etc/ssh/sshd_config"
