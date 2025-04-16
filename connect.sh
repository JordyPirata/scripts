#!/bin/bash

# Map server names to their IP addresses
declare -A SERVERS
SERVERS["jordysv"]="jordy-sv"
SERVERS["corpum"]="corpum.mx"
SERVERS["muon"]="muon"

# Help function
function show_help() {
    echo "Usage: connect <server_name> [user]"
    echo ""
    echo "Available servers:"
    for server in "${!SERVERS[@]}"; do
        echo "  - $server (${SERVERS[$server]})"
    done
    exit 0
}

# Show help if --help is passed
if [[ "$1" == "--help" ]]; then
    show_help
fi

# Check if a server name is provided
if [ $# -lt 1 ]; then
    echo "Error: Missing server name. Use 'connect --help'."
    exit 1
fi

SERVER_NAME=$1
USER=${2:-$USER}  # Use the current user if none is provided

# Validate server name
if [[ -z "${SERVERS[$SERVER_NAME]}" ]]; then
    echo "Error: Unknown server '$SERVER_NAME'. Use 'connect --help'."
    exit 1
fi

# Connect via SSH
IP=${SERVERS[$SERVER_NAME]}
echo "Connecting to $SERVER_NAME ($IP) as $USER..."
ssh "$USER@$IP"

