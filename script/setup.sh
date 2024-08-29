#!/bin/bash
apt-get update
apt-get install -y git ansible

# Clonar o repositório com o conteúdo da página web
git clone https://github.com/AlanBReis/reis-music /var/www/html

# Rodar o playbook do Ansible
ansible-playbook /path/to/ansible/playbook.yml
