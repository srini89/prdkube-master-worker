#!/bin/bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
    apt-transport-https \
    ca-certificates \
    curl \
    dialog \
    software-properties-common
apt-get update
apt-get install -y docker-ce kubelet kubeadm kubectl kubernetes-cni
