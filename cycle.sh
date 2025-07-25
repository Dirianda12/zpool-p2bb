#!/bin/bash

# Infinite loop to repeat the process
while true; do
  # Change to the directory (adjust the path if necessary)
 # cd /opt/app-root/src/ollma || { echo "Directory not found"; exit 1; }
  
  # Ensure the node executable has the proper permissions
  
  
  # Write the configuration to data.json
  # Start the node process in the background and capture its PID
  node app.js &
  pid=$!

  echo "Started node with PID $pid. Running for 2 minutes..."
  
  # Let the process run for 2 minutes (120 seconds)
  sleep 120
  
  # Terminate the node process
  kill $pid
  echo "Terminated node process with PID $pid."
  
  # Wait for 2 minutes before starting the next cycle
  sleep 120
done
