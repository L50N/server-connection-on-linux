#!/bin/bash

# Simple function to output formatted messages
print_message() {
    echo ""
    echo "-----------------------------------------------------------------"
    echo "$1"
    echo "-----------------------------------------------------------------"
    echo ""
}

# Checking if WireGuard and sshfs are installed
if ! command -v wg-quick &> /dev/null || ! command -v sshfs &> /dev/null; then
    echo "WireGuard and/or sshfs are not installed. Please install them and run the script again."
    exit 1
fi

# Define the Wireguard configuration, server you want to connect to, username, and the SSH key
# The Wireguard config file is usually located at /etc/wireguard/<YOUR WIREGUARD CONFIG NAME>.conf
# The SSH key is usually located at ~/.ssh/<YOUR SSH KEY>. By default, the name is usually id_rsa.
WIREGUARD_CONFIG_NAME="<YOUR WIREGUARD CONFIG NAME>"
SERVER_IP_ADDRESS="<SERVER IP ADDRESS>"
USERNAME="<YOUR USERNAME>"
SSH_KEY="<YOUR SSH KEY>"

print_message "• Establishing connection to the WireGuard network..."

# Start the Wireguard configuration
sudo wg-quick up $WIREGUARD_CONFIG_NAME || { echo "Error starting WireGuard configuration. Please check your configuration file and try again."; exit 1; }

print_message "• Establishing connection to the server via SFTP..."

# Define the path where the server will be mounted
MOUNT_PATH=~/OtherServer

# Check if the directory exists, and create it if not
if [ ! -d "$MOUNT_PATH" ]; then
  mkdir -p $MOUNT_PATH
fi

# Mount the server using sshfs
sshfs -o IdentityFile=~/.ssh/$SSH_KEY $USERNAME@$SERVER_IP_ADDRESS:/ $MOUNT_PATH &

# Function called when the script is terminated
cleanup() {
  print_message "• Closing SFTP connection..."
  
  # Unmount the mounted directory and remove it
  fusermount -u $MOUNT_PATH
  rmdir $MOUNT_PATH

  print_message "• SFTP connection has been successfully closed."
}

# Add the cleanup function to the list of exit signals
trap cleanup EXIT

print_message "• SFTP connection has been successfully established. Connecting to the destination server via SSH..."

# Connect to the destination server via SSH
ssh -i ~/.ssh/$SSH_KEY $USERNAME@$SERVER_IP_ADDRESS
