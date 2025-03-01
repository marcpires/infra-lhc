# Lembrete: linhas de comandos do Makefile começam com tab e não espaço.
SHELL := /bin/bash 

all: plan apply

check: check-tools check-pod

start: check-tools setup-kubeconfig init plan apply check-pod

plan:
	terraform plan

init:
	terraform init

apply:
	terraform apply -auto-approve
	@sleep 10

destroy:
	terraform destroy -auto-approve

clean:
	rm -rf .terraform terraform.tfstate*

setup-kubeconfig:
	test -d ~/.kube || mkdir -p ~/.kube
	test -f ~/.kube/config && mv ~/.kube/config ~/.kube/config-$$(date +%Y%m%d%H%M%S) || true
	sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
	sudo chown $$(id -u):$$(id -g) ~/.kube/config
	echo 'export KUBECONFIG=~/.kube/config' >> ~/.bashrc
	@echo 'Agora execute uma nova sessâo da sua shell'

check-tools:
	@command -v git >/dev/null 2>&1 || { echo >&2 "Git não está instalado"; exit 1; }
	@command -v terraform >/dev/null 2>&1 || { echo >&2 "Terraform não está instalado"; exit 1; }
	@command -v helm >/dev/null 2>&1 || { echo >&2 "Helm não está instalado"; exit 1; }
	@command -v kubectl >/dev/null 2>&1 || { echo >&2 "Kubectl não está instalado"; exit 1; }
	@echo "Todas as ferramentas necessárias estão instaladas."

check-pod:
	kubectl run test-pod --image=nginx --restart=Never --port=80
	sleep 5
	kubectl wait --for=condition=Ready pod/test-pod --timeout=30s || exit 1
	kubectl delete pod test-pod --ignore-not-found
	echo 'Deploy de pods funcionando.'
