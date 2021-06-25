NUM_MASTER_NODE=$(shell grep "NUM_MASTER_NODE =" Vagrantfile | tr -d ' ' | cut -d '=' -f2)
NUM_WORKER_NODE=$(shell grep "NUM_WORKER_NODE =" Vagrantfile | tr -d ' ' | cut -d '=' -f2)

ssh: up 
	for i in `seq 1 $(NUM_MASTER_NODE)` ; do \
		gnome-terminal -- vagrant ssh kubemaster$$i ; \
	done;
	for i in `seq 1 $(NUM_WORKER_NODE)` ; do \
		gnome-terminal -- vagrant ssh kubenode$$i ; \
	done;

up:
	vagrant up

.PHONY: ssh up
