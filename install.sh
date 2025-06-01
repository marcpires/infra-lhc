#!/usr/bin/env bash
# Aborta a execução em caso algum comando termine com o status diferente de zero
set -e

# Executar como root
if [ "$(id -u)" -ne 0 ]; then
    ( echo "Execute com sudo ou como root" ; exit 1 )
fi

[[ ${INSTALL_URL} ]] || ( echo "URL de instalação não informada" ; exit 1 )

# Identifica o sistema operacional em uso
case "$(uname -s)" in
    Linux*) OS="linux" ;;
    *) OS="unknown" ;;
esac

# Identifica a arquitetura em uso
ARCH_RAW=$(uname -m)
case "$ARCH_RAW" in
    x86_64) ARCH="amd64" ;;
    *) ARCH="unknown" ;;
esac

# Identifica a distribuição em uso
DISTRO=$(grep -Po '^ID_LIKE=\K.*' /etc/os-release)
case "$DISTRO" in
    debian) DISTRO="debian-like" ;;
    *) DISTRO="unknown" ;;
esac

# Identifica a necessidade de instalar o kubectl
command -v kubectl &> /dev/null || \
( if [ "$OS" == "linux" ]; then
  curl -sLO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl"
  chmod +x kubectl
  mv kubectl /usr/local/bin/
  command -v kubectl &> /dev/null || ( echo "Kubectl não pode ser instalado" ; exit 1 )
else
	echo "Não consigo instalar kubectl neste sistema operacional"
	exit 1
fi )

# Identifica a necessidade de instalar o docker
docker run --rm hello-world &> /dev/null || (\
if [ "$OS" == "linux" ]; then
		if [ "$DISTRO" == "debian-like" ]; then
    apt-get update
    apt-get install -y ca-certificates curl
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  	docker run --rm hello-world &> /dev/null || ( echo "Docker não pode ser instalado" ; exit 1 )
  fi
else
	echo "Não consigo instalar docker neste sistema operacional"
	exit 1
fi )

# Identifica a necessidade de instalar o k3s
command -v k3s &> /dev/null || (\
if [ "$OS" == "linux" ]; then
	curl -sfL https://get.k3s.io | sh -
	command -v k3s &> /dev/null || ( echo "K3s não pode ser instalado" ; exit 1 )
else
	echo "Não consigo instalar k3s neste sistema operacional"
	exit 1
fi )

# Identifica a necessidade de instalar o helm
command -v helm &> /dev/null || (\
if [ "$OS" == "linux" ]; then
	curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
	command -v helm &> /dev/null || ( echo "Helm não pode ser instalado" ; exit 1 )
else
	echo "Não consigo instalar helm neste sistema operacional"
	exit 1
fi )

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install argocd argo/argo-cd --version 7.8.23 -n argocd --create-namespace --set server.extraArgs={--insecure}

kubectl apply -f https://raw.githubusercontent.com/${REPO}/refs/heads/${BRANCH}/apps/argo/ingress.yaml
