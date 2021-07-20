#!/bin/bash

# Source: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

# Letting iptables see bridged traffic
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

# Installing kubeadm, kubelet and kubectl

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl

sudo curl -fsSLo \
    /usr/share/keyrings/kubernetes-archive-keyring.gpg \
    https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] \
    https://apt.kubernetes.io/ kubernetes-xenial main" \
    | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl && echo "kubelet kubeadm kubectl successfully installed"
sudo apt-mark hold kubelet kubeadm kubectl
echo "install-kubeadm finished"
