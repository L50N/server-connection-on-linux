#!/bin/bash

clear

echo "• Connecting to the Wireguard network"
echo " "

sleep 2
# Start the Wireguard configuration
sudo wg-quick up <YOUR WIREGUARD CONFIG NAME>

clear

# Function called when the script is terminated
cleanup() {
  echo "• Closing SFTP connection"
  fusermount -u ~/OtherServer
  rmdir ~/OtherServer
  clear
}

# Establish SFTP connection
echo "• Connecting to the server via SFTP"
echo " "

# Create the directory where the server will be mounted
mkdir -p ~/OtherServer

# Mount the server using sshfs
sshfs -o IdentityFile=~/.ssh/id_rsa user@<SERVER IP ADRESS>:/ ~/OtherServer &

echo "• SFTP connection established"
clear

# Connect to the destination server via SSH
ssh -i ~/.ssh/id_rsa user@<SERVER IP ADRESS>

# Add the cleanup function to the list of exit signals
trap cleanup EXIT
