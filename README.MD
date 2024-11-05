# terraform-keyspaces

Este projeto configura um ambiente de teste para Amazon Keyspaces utilizando Terraform, com suporte para múltiplas regiões.

## Estrutura do Projeto

- **environments/**: Diretório contendo os ambientes específicos.
  - **DC01/**: Ambiente 1, configurado para utilizar o módulo `aws_keyspaces`.
    - `main.tf`: Invoca o módulo `aws_keyspaces` com configurações específicas para o ambiente `DC01`.
    - `terraform.tfvars`: Arquivo com valores de variáveis específicos para o ambiente `DC01`.
    - `variables.tf`: Declara as variáveis necessárias para o ambiente `DC01`.
  - **DC02/**: Ambiente 2, com estrutura similar a `DC01`.
    - `main.tf`: Invoca o módulo `aws_keyspaces` com configurações para o ambiente `DC02`.
    - `terraform.tfvars`: Arquivo com valores de variáveis específicos para o ambiente `DC02`.
    - `variables.tf`: Declara as variáveis necessárias para o ambiente `DC02`.

- **modules/**: Diretório que contém o módulo reutilizável.
  - **aws_keyspaces/**: Módulo que configura recursos do Amazon Keyspaces.
    - `iam.tf`: Configura políticas IAM necessárias para o Keyspaces.
    - `keyspaces.tf`: Define o Keyspace e tabelas no Amazon Keyspaces.
    - `variables.tf`: Declara as variáveis utilizadas pelo módulo.
    - `vpc_endpoint.tf`: Configura o VPC Endpoint para o Keyspaces.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado na sua máquina.
- Credenciais da AWS configuradas.
