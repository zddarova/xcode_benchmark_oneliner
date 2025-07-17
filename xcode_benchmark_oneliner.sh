#!/bin/bash

# Repository URL and folder name
REPO_URL="https://github.com/devMEremenko/XcodeBenchmark.git"
REPO_NAME="XcodeBenchmark"

# Check if the directory exists
if [ -d "$REPO_NAME" ]; then
    echo "Directory $REPO_NAME already exists."
    
    # Check if it's a git repository
    if [ -d "$REPO_NAME/.git" ]; then
        echo "Found existing git repository. Pulling latest changes..."
        cd "$REPO_NAME"
        
        # Stash any local changes (optional)
        git stash
        
        # Pull latest changes
        git pull origin main || git pull origin master
        
        echo "Repository updated successfully!"
    else
        echo "Directory exists but is not a git repository."
        echo "Please remove the directory or rename it, then run the script again."
        exit 1
    fi
else
    echo "Directory $REPO_NAME does not exist. Cloning repository..."
    git clone "$REPO_URL"
    cd "$REPO_NAME"
    echo "Repository cloned successfully!"
fi

# Run the benchmark script
echo "Running benchmark..."
sh benchmark.sh
