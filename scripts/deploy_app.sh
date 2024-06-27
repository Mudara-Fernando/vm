#!/bin/bash

# Define directories
WEB_DIR="/home/adminuser/vm/web"
API_DIR="/home/adminuser/vm/api"

# Pull the latest code
cd $WEB_DIR
git pull origin main
cd $API_DIR
git pull origin main

# Build and run Docker Compose
cd $WEB_DIR
docker-compose down
docker-compose up -d --build
cd $API_DIR
docker-compose down
docker-compose up -d --build