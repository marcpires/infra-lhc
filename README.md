# LHC Kubernetes Homelab Infra

Esse é um projeto aberto e colaboratibo e têm como objetivo, prover um ambiente para criação de laboratórios, utilizando Kubernetes com a utilização da IaC e GitOps
para gerenciar toda a sua configuração.

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

### 📋 Pré-requisitos

De que coisas você precisa para instalar o software e como instalá-lo?
- [make](https://www.gnu.org/software/make/manual/make.html)
- [k3s](https://docs.k3s.io/installation)
- [helm](https://helm.sh/docs/intro/install/)
- [terraform](https://developer.hashicorp.com'/terraform/install?product_intent=terraform#linux)
- [kubectl](https://kubernetes.io/pt-br/docs/tasks/tools/install-kubectl-linux/)
- [git](https://git-scm.com/downloads)


Realize a verificação das ferramentas execute em seu terminal
```
make check-tools
```

### 🔧 Instalação

Para realizar a instalação do seu ambiente, execute os seguintes passos.

Diga como essa etapa será:

Realize um fork do repositório para sua conta acessando o seguinte endereço
```
https://github.com/lhc/infra/fork
```

Clone o repositório para a sua estação de desenvolvimento:
```
git clone https://gitbub.com/lhc/infra.git
```

Atualize as referencias do repositório, execute: 
```
git remote rename origin upstream
git remote add origin <endereço do seu ramificação>
```

`upstream` apontará para o repositório git@github.com:lhc/infra.git
`origin` agora apontará para o repositório na sua conta

Para iniciar a instalação, execute:

```
make start
```

Aplique as alterações feitas:
```
make
```

Para verificar os recursos criados para o ArgoCD, execute:
```
kubectl get all -n argocd
```
Para verificar os applications sets, execute:
```
kubectl get applicationset -n argocd -o yaml
```

## 🖇️ Colaborando

Por favor, leia o [CONTRIBUTING.md](https://gist.github.com/usuario/linkParaInfoSobreContribuicoes) para obter detalhes sobre o nosso código de conduta e o processo para nos enviar pedidos de solicitação.

## 📌 Versão

Nós usamos [SemVer](http://semver.org/) para controle de versão. Para as versões disponíveis, observe as [tags neste repositório](https://github.com/suas/tags/do/projeto). 

## ✒️ Autores

Mencione todos aqueles que ajudaram a levantar o projeto desde o seu início

* **Andreyev** - 
* **Marcelo Pires** - 
* **Douglas Azevedo** - 

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

