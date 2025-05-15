<!-- Este arquivo é gerado automaticamente, edite o README.template -->
# LHC Kubernetes Homelab Infra

Esse é um projeto aberto e colaborativo e têm como objetivo, prover um ambiente para criação de laboratórios, utilizando Kubernetes com a utilização da IaC e GitOps
para gerenciar toda a sua configuração.

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

### 📋 Pré-requisitos

De que coisas você precisa para instalar o software e como instalá-lo?
- [k3s](https://docs.k3s.io/quick-start#install-script)
- [helm](https://helm.sh/docs/intro/install/#from-script)
- [terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform#linux)
- [kubectl](https://kubernetes.io/pt-br/docs/tasks/tools/install-kubectl-linux/#instale-o-bin%C3%A1rio-kubectl-no-linux-usando-o-curl)
- [git](https://git-scm.com/downloads)


### 🔧 Instalação

Para realizar a instalação do seu ambiente, execute os seguintes passos.

```
export INSTALL_URL=https://raw.githubusercontent.com/marcpires/infra-lhc/refs/heads/main/install.sh
curl -s $INSTALL_URL | sudo env INSTALL_URL="$INSTALL_URL" bash
```

## 🖇️ Colaborando

Por favor, leia o [CONTRIBUTING.md](https://github.com/lhc/infra/blob/main/CONTRIBUTING.md) para obter detalhes sobre o nosso código de conduta e o processo para nos enviar pedidos de solicitação.

## 📌 Versão

Nós usamos [SemVer](http://semver.org/) para controle de versão. Para as versões disponíveis, observe as [tags neste repositório](https://github.com/suas/tags/do/projeto).

## ✒️ Autores

Mencione todos aqueles que ajudaram a levantar o projeto desde o seu início

* **Andreyev** -
* **Marcelo Pires** -
* **Douglas Esteves** -
* **Manassés Souza** -
* **Bruno Lima** -

Você também pode ver a lista de todos os [colaboradores](https://github.com/lhc/infra/graphs/contributors) que participam deste projeto.

## 📄 Licença

Este projeto está sob a licença (GPL v3) - veja o texto original em [LICENSE.md](https://github.com/lhc/infra/LICENSE.md) para detalhes.

## 🎁 Expressões de gratidão

* Conte a outras pessoas sobre este projeto 📢;
* Convide alguém da equipe para um café ☕;
* Um agradecimento publicamente 🫂;
* etc.


---
⌨️ com ❤️ por [LHC](https://lhc.net.br/) 😊

