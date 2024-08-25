#!/bin/bash

# Check if ngrok token is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide your ngrok authtoken as an argument."
  echo "Usage: ./run_notebook.sh <ngrok_authtoken>"
  exit 1
fi

# Install Jupyter Notebook
python3 -m pip install notebook

# Download ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

# Extract ngrok
tar -xvf ngrok-v3-stable-linux-amd64.tgz

# Set up ngrok with the provided token
./ngrok authtoken $1

# Run ngrok on port 8888 and start Jupyter Notebook
./ngrok http 8888 & python3 -m notebook --allow-root
