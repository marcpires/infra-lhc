# Instalação da infra do LHC

Antes de prosseguir você precisará instalar os seguintes binários:
- [make](https://www.gnu.org/software/make/manual/make.html)
- [k3s](https://k3s.io/)
```
  curl -sfL https://get.k3s.io | sh - 
```
- [helm](https://helm.sh/docs/intro/install/)
- [terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform#linux)
- [git](https://git-scm.com/downloads)

Usando o git, clone este repositório.
* Para testar seus binários, execute:
```
make check-tools
```
* Para iniciar sua instalação, execute:
```
make start
```
* Para aplicar as alterações feitas:
```
make
```
