#!/bin/sh

service=$1
wwwdir="/var/www/html"

# sudo apt update -y

git submodule add https://github.com/laravel/lumen images/php/app
git submodule update

cp .env.docker.example .env
cp .env.app.example images/php/app/.env

docker-compose up --build -d

docker-compose run --rm -w $wwwdir/app php composer install

# todo: adduser $1_user && usermod -aG sudo $1_user && su - $1_user
