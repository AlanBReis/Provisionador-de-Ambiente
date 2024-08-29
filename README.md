cat <<EOL > README.md
# Provisionador de Ambientes

Este projeto automatiza o provisionamento e a configuração de ambientes de desenvolvimento, utilizando Terraform, Ansible e scripts customizados. O objetivo é clonar um repositório, provisionar a infraestrutura necessária na AWS e configurar os servidores para hospedar uma página web. O projeto suporta múltiplos ambientes, como desenvolvimento, staging e produção.

## Estrutura do Projeto

- **terraform/**: Contém os arquivos de configuração do Terraform para provisionamento dos ambientes na AWS.
- **ansible/**: Contém os playbooks e roles do Ansible para configuração dos servidores provisionados.
- **scripts/**: Scripts adicionais para automatizar tarefas comuns, como clonagem de repositórios e deploy.
- **LICENSE**: Licença do projeto.
- **README.md**: Este arquivo.

## Requisitos

- Terraform
- Ansible
- AWS CLI configurado
- Chave SSH configurada para acesso aos servidores

## Configuração do Terraform

Navegue até o diretório \`terraform/\`:

\`\`\`bash
cd terraform
\`\`\`

Configure as variáveis de ambiente (ajuste conforme necessário):

\`\`\`bash
export TF_VAR_region="us-west-2"
export TF_VAR_instance_type="t2.micro"
\`\`\`

Inicialize o Terraform:

\`\`\`bash
terraform init
\`\`\`

Aplique a configuração para criar os recursos na AWS:

\`\`\`bash
terraform apply
\`\`\`

## Configuração do Ansible

Navegue até o diretório \`ansible/\`:

\`\`\`bash
cd ansible
\`\`\`

Edite o arquivo \`inventory.ini\` para adicionar os hosts provisionados pelo Terraform.

Execute o playbook para configurar o ambiente:

\`\`\`bash
ansible-playbook -i inventory.ini playbook.yml
\`\`\`

## Scripts Adicionais

### scripts/setup.sh

Este script configura o ambiente local para desenvolvimento.

\`\`\`bash
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
\`\`\`

### scripts/deploy.sh

Este script aplica a configuração do Terraform e executa o Ansible para provisionar e configurar a infraestrutura.

\`\`\`bash
#!/bin/bash

# Aplicar Terraform
cd terraform
terraform apply -auto-approve

# Configurar Ansible
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
\`\`\`

## Licença

Este projeto é licenciado sob os termos da licença MIT. Veja o arquivo \`LICENSE\` para mais detalhes.
EOL
