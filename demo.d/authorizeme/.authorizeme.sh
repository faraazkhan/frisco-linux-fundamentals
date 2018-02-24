#!/usr/bin/env bash

# Check if you are root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  # Exit it not root
  exit 1
fi
# Read Username from the command line
echo -n "Enter your github username: "
read username
echo -n  "Adding $username as an authorized ssh user on this system"

# Add user to the system
useradd ${username}

# Create .ssh directory
mkdir -p /home/${username}/.ssh

# Get public keys from Github.com
curl -sLk https://github.com/${username}.keys >> /home/${username}/.ssh/authorized_keys

# Ensure correct file permissions
chown -R ${username}:${username} /home/${username}
chmod 600 /home/${username}/.ssh/authorized_keys
chmod 700 /home/${username}/.ssh
