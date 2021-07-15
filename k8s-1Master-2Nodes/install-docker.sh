#!/bin/bash

# Install instructions as shown on 
# https://kubernetes.io/docs/setup/production-environment/container-runtimes/#docker

sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg > /tmp/docker.gpg.key
sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg
sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg /tmp/docker.gpg.key  
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update
# Install most recent version
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# Or install certain version
#    VERSION_STRING=5:20.10.7~3-0~ubuntu-focal
#    sudo apt-get install docker-ce=${VERSION_STRING} docker-ce-cli=<VERSION_STRING> containerd.io

# Enable Docker
sudo mkdir -p /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

# Restart Docker and enable on boot:
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
