#!/bin/sh

service=$1
wwwdir="/var/www/html"

git submodule add https://github.com/laravel/lumen images/php/app
git submodule update

cp .env.docker.example .env
cp .env.app.example images/php/app/.env

docker-compose up --build -d

docker-compose run --rm -w $wwwdir/app php composer install
