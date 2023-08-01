#!/bin/bash

# Criando o grupo "engenharia"
sudo groupadd engenharia

# Criando usuário "joao"
sudo useradd -m -g engenharia joao
echo "senha_do_joao" | sudo passwd --stdin joao

# Criando usuário "maria"
sudo useradd -m -g engenharia maria
echo "senha_da_maria" | sudo passwd --stdin maria

# Criando diretórios personalizados para cada usuário
sudo mkdir /home/joao/documentos
sudo mkdir /home/maria/documentos

# Definindo permissões nos diretórios
sudo chmod 700 /home/joao/documentos
sudo chmod 700 /home/maria/documentos

# Definindo proprietários e grupos nos diretórios
sudo chown joao:engenharia /home/joao/documentos
sudo chown maria:engenharia /home/maria/documentos

# Mensagem de conclusão
echo "Configuração concluída! Os usuários joao e maria foram criados com os diretórios de documentos configurados."