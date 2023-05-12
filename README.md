# Server connection via linux terminal | SSH and SFTP

This script establishes a connection to a Wireguard network and enables an SFTP connection to a remote server.

## Prerequisites

- Wireguard must be installed on the system.
- SSH keys must be configured to establish a connection to the target server.

## Usage

1. Open the script (`script.sh`) in a text editor.
2. Customize the following values:

   - `SERVER_USER`: Enter the server's username.
   - `SERVER_IP`: Enter the server's IP address.
   - `WIREGUARD_CONFIG_NAME`: Enter the name of the Wireguard configuration.

3. Save the script after making the customization.

4. Run the script by executing the command `./script.sh` in a terminal.

The script will automatically establish a connection to the Wireguard network, using the provided values for the server and Wireguard configuration, and set up an SFTP connection to the remote server.

## Cleanup

The script includes a cleanup function that is automatically called when the script terminates. The cleanup function disconnects the SFTP connection and removes the mounted directory.

## Notes

- Ensure that the Wireguard configuration is properly set up to establish a successful connection to the network.
- Verify that the specified server IP address and username are correct.
