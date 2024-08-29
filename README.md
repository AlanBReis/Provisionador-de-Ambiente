# Provisionador de Ambientes

Este projeto visa automatizar o provisionamento e configuração de ambientes de desenvolvimento, utilizando Terraform e Ansible. O objetivo é criar e configurar servidores virtuais com as ferramentas e softwares necessários para iniciar um novo projeto. O projeto suporta múltiplos ambientes, como desenvolvimento, staging e produção.

## Estrutura do Projeto

- **terraform/**: Contém os arquivos de configuração do Terraform para provisionamento dos ambientes.
- **ansible/**: Contém os playbooks e roles do Ansible para configuração do ambiente.
- **scripts/**: Scripts adicionais para automatizar tarefas comuns.
- **LICENSE**: Licença do projeto.
- **README.md**: Este arquivo.

## Requisitos

- Terraform
- Ansible
- Um provedor de nuvem (AWS, Azure, GCP, etc.)

## Configuração do Terraform

1. Navegue até o diretório `terraform/`:

    ```bash
    cd terraform
    ```

2. Configure as variáveis de ambiente (ajuste conforme necessário):

    ```bash
    export TF_VAR_region="us-east-1"
    export TF_VAR_instance_type="t2.micro"
    ```

3. Inicialize o Terraform:

    ```bash
    terraform init
    ```

4. Aplique a configuração para criar os recursos:

    ```bash
    terraform apply
    ```

## Configuração do Ansible

1. Navegue até o diretório `ansible/`:

    ```bash
    cd ansible
    ```

2. Edite o arquivo `inventory.ini` para adicionar os hosts provisionados pelo Terraform.

3. Execute o playbook para configurar o ambiente:

    ```bash
    ansible-playbook -i inventory.ini playbook.yml
    ```

## Scripts Adicionais

### `scripts/setup.sh`

Este script configura o ambiente local para desenvolvimento.

```bash
#!/bin/bash

# Atualizar pacotes
sudo apt-get update

# Instalar Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update
sudo apt-get install terraform

# Instalar Ansible
sudo apt-get install ansible


scripts/deploy.sh
Este script aplica a configuração do Terraform e executa o Ansible.

#!/bin/bash

# Aplicar Terraform
cd terraform
terraform apply -auto-approve

# Configurar Ansible
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml