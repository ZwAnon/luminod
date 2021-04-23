#!/bin/sh

service=$1
wwwdir="images/php/app/"

cp .env.docker.example .env

docker-compose up --build -d

git clone https://github.com/laravel/lumen.git $wwwdir
cp .env.app.example images/php/app/.env

#docker-compose run --rm -w /var/www/html/app php composer install
