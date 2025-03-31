#!/bin/bash

set -e

read -p "Enter the project name: " project_name
mkdir $project_name
cd $project_name

echo "Initializing npm project ..."
npm init -y

echo "Installing TypeScript ..."
npm install typescript ts-node --save-dev

echo "Initializing TypeScript configuration..."
npx tsc --init

mkdir src
echo 'console.log("Hello, TypeScript!");' > src/index.ts

sed -i '' 's/"test": "echo \\"Error: no test specified\\" && exit 1"/"build": "tsc"/' package.json

echo "Project initialized successfully!"

if command -v webstorm &> /dev/null
then
    echo "Opening project in WebStorm..."
    webstorm .
else
    # Fall back to VS Code if WebStorm is not found
    if command -v code &> /dev/null
    then
        echo "Opening project in VS Code..."
        code .
    else
        echo "Neither WebStorm nor VS Code is installed. Open the project in your editor."
    fi
fi