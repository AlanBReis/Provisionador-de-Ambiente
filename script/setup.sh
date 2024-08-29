#!/bin/bash
apt-get update
apt-get install -y git ansible

# Rodar o playbook do Ansible
ansible-playbook /path/to/ansible/playbook.yml
