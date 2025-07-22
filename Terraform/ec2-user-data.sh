#!/bin/bash
apt update -y
apt install docker.io docker-compose -y
usermod -aG docker ubuntu
mkdir -p /home/ubuntu/keycloak-ha
cd /home/ubuntu/keycloak-ha
curl -O https://raw.githubusercontent.com/your-repo/docker-compose.yml
docker-compose up -d