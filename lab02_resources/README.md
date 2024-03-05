# tf-acn-treinamento
Laboratórios práticos e desafio prático para criação de ambiente

## Conexão com AWS

Para conectar-se à AWS, utilize uma das opções abaixo:

### a) Configuração de profile

```sh
$ aws configure --profile tf-acn-treinamento
```

## Inicializando Terraform

Para inicializar o terraform, execute os comandos abaixo:

```sh
$ cd lab01_providers
$ terraform init
```

A pasta `.terraform` será criada após a inicialização contendo todos plugins necessários.

## Planejando a infraestrutura com Terraform

Para validar os recursos que serão implementados, execute o comando abaixo:

```sh
$ terraform plan
```

## Aplicando a infraestrutura com Terraform

Para efetivar a implementação dos recursos provisionados, execute o comando abaixo:

```sh
$ terraform apply
```
**Uma confirmação para implementação será solicitada 

## Refresh no arquivo State

O comando abaixo quando executado, realiza um escaneamento no provedor e validar modificações feitas manualmente fora do terraform e atualiza o arquivo State com essas modificações

```sh
$ terraform apply -refresh-only
```

