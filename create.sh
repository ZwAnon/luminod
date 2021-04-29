#!/bin/sh

wwwdir="/var/www/html"

read -p "Service Name: " service
read -s -p "Database Password: " password
read -e -p "App Repo: " -i "https://github.com/laravel/lumen" repo

# set docker ENV vars
dockerEnv=`cat .env.docker.example`
newDockerEnv=${dockerEnv//lumen/$service}
env=${newDockerEnv//secret/$password}
echo "$env" > .env
echo

# install Lumen (todo: change submodule)
git submodule add $repo images/php/app
git submodule update

# set Lumen ENV
lumenEnv=`cat .env.app.example`
newLumenEnv=${lumenEnv//lumen/$service}
lenv=${newLumenEnv//secret/$password}
echo "$lenv" > images/php/app/.env
echo

docker-compose up --build -d

docker-compose run --rm -w $wwwdir/app php composer install

# todo: adduser $1_user && usermod -aG sudo $1_user && su - $1_user
