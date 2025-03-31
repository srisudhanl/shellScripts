#!/bin/bash

### restart the container
ssh -p 22 hesham@interserver.yuva.dev "cd ~/vscode; cd srisudhan/; ./end.sh; sleep 3; ./begin.sh;"


### remove the known host if any

target="is.yuva.dev"
known_hosts_file="$HOME/.ssh/known_hosts"
# Check if the known_hosts file exists
if [ ! -f "$known_hosts_file" ]; then
    echo "Error: File '$known_hosts_file' not found"
    exit 1
fi
# Escape special characters in the target for sed
escaped_target=$(printf '%s\n' "$target" | sed -e 's/[]\/$*.^[]/\\&/g')

# Remove lines containing the specified target (IP or hostname)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS version
    sed -i '' "/$escaped_target/d" "$known_hosts_file"
else
    # Linux version
    sed -i "/$escaped_target/d" "$known_hosts_file"
fi
echo "Lines containing '$target' have been removed from $known_hosts_file"


### Copy the current keys to the server
echo "**************************************************************"
echo "Copying keys to container. Please enter password if asked..."
# ssh-copy-id -o StrictHostKeyChecking=no -p 2200 hesham@is.yuva.dev
ssh-copy-id -p 2202 hesham@is.yuva.dev




