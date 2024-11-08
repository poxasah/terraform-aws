# terraform-aws-multidc

Este projeto configura um ambiente de teste na Amazon utilizando Terraform, com suporte para múltiplas regiões.

## Estrutura do Projeto

- **environments/**: Diretório contendo os ambientes específicos.
  - **DC01/**: Ambiente 1, configurado para utilizar os módulos.
    - `main.tf`: Invoca o módulo com configurações específicas para o ambiente `DC01`.
    - `terraform.tfvars`: Arquivo com valores de variáveis específicos para o ambiente `DC01`.
    - `variables.tf`: Declara as variáveis necessárias para o ambiente `DC01`.
  - **DC02/**: Ambiente 2, com estrutura similar a `DC01`.
    - `main.tf`: Invoca o módulo com configurações para o ambiente `DC02`.
    - `terraform.tfvars`: Arquivo com valores de variáveis específicos para o ambiente `DC02`.
    - `variables.tf`: Declara as variáveis necessárias para o ambiente `DC02`.

- **modules/**: Diretório que contém o módulo reutilizável.
  - **aws_keyspaces/**: Módulo que configura recursos do Amazon Keyspaces.
    - `keyspaces.tf`: Define o Keyspace e tabelas no Amazon Keyspaces.
    - `variables.tf`: Declara as variáveis utilizadas pelo módulo.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado na sua máquina.
- Credenciais da AWS configuradas.
