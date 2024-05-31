#!/bin/bash

# Check if the directory path is provided as a command-line argument
if [ -z "$1" ]; then
    echo "Usage: $0 <path/to/flutter/packages>"
    exit 1
fi

# Set the directory where the Flutter packages are located
flutter_dir="$1"

# Loop through each directory in the specified directory
for dir in "$flutter_dir"/*/; do
    # Check if the directory contains a Flutter project
    if [ -d "$dir/lib" ]; then
        echo "Found Flutter package: $dir"
        read -p "Do you want to clean this package? (y/n) " clean_package
        if [ "$clean_package" == "y" ]; then
            echo "Cleaning Flutter package: $dir"
            cd "$dir"
            flutter clean
        else
            echo "Skipping Flutter package: $dir"
        fi
    fi
done