#!/bin/bash

# Atualizar os repositórios e pacotes do sistema
sudo apt update
sudo apt upgrade -y

# Instalar o servidor Apache
sudo apt install -y apache2

# Criar um diretório para o site
sudo mkdir /var/www/meusite

# Configurar permissões para o diretório do site
sudo chown -R www-data:www-data /var/www/meusite
sudo chmod -R 755 /var/www/meusite

# Criar um arquivo de exemplo index.html
echo "<html><body><h1>Bem-vindo ao Meu Site!</h1></body></html>" | sudo tee /var/www/meusite/index.html

# Criar um arquivo de configuração de host virtual (vhost)
sudo tee /etc/apache2/sites-available/meusite.conf <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/meusite
    ServerName meusite.com
    ServerAlias www.meusite.com

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory /var/www/meusite>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF

# Habilitar o vhost e reiniciar o Apache
sudo a2ensite meusite.conf
sudo systemctl restart apache2

# Configurar firewall para permitir tráfego HTTP (porta 80)
sudo ufw allow 80

# Exemplo de instalação do PHP (opcional)
# sudo apt install -y php libapache2-mod-php
# sudo systemctl restart apache2

# Exemplo de instalação do MySQL (opcional)
# sudo apt install -y mysql-server
# sudo mysql_secure_installation

# Exemplo de configuração de certificado SSL/TLS (opcional)
# sudo apt install -y certbot python3-certbot-apache
# sudo certbot --apache

# Mensagem de conclusão
echo "Servidor web provisionado com sucesso. Seu site está disponível em http://meusite.com"
