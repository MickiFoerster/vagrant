NUM_MASTER_NODE=$(shell grep "NUM_MASTER_NODE =" Vagrantfile | tr -d ' ' | cut -d '=' -f2)
NUM_WORKER_NODE=$(shell grep "NUM_WORKER_NODE =" Vagrantfile | tr -d ' ' | cut -d '=' -f2)

ssh: up 
	for i in `seq 1 $(NUM_MASTER_NODE)` ; do \
		gnome-terminal -- vagrant ssh k8s-1Master-2Nodes-kubemaster$$i ; \
	done;
	for i in `seq 1 $(NUM_WORKER_NODE)` ; do \
		gnome-terminal -- vagrant ssh k8s-1Master-2Nodes-kubenode$$i ; \
	done;

up:
	vagrant up

.PHONY: ssh up

# What is missing:
# master node shows token
#   kubeadm token list
#
# worker nodes join automatically:
# - kubeadm join --token zgjbn0.3r9sjloo8pzobiqa 192.168.99.101:6443 --discovery-token-ca-cert-hash sha256:16fb9c9a21ea1925e96b65a0f3e50259721493e8986983b134a8bd4c4c433b24
# - hash provided by command:
#   openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
