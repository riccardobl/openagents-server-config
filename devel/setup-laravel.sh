#!/bin/bash


export DEBIAN_FRONTEND=noninteractive
apt update
apt upgrade -y 
apt install -y software-properties-common lsb-release curl gpg git
add-apt-repository ppa:ondrej/php 
apt update
apt install -y php8.2 php8.2-dev php8.2-cli php8.2-bz2 php8.2-curl php8.2-mbstring php8.2-intl php8.2-zip php8.2-bcmath php8.2-gmp php8.2-simplexml php8.2-xml php8.2-dom php8.2-sqlite3
apt install -y composer  php-pear zlib1g-dev
pecl channel-update pecl.php.net 
pecl install grpc-1.57.0 protobuf

echo "extension=grpc.so" >> /etc/php/8.2/cli/php.ini

curl -fsSL https://deb.nodesource.com/setup_22.x |  bash - 
apt-get install -y nodejs 

