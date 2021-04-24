# luminod
### Docker + Lumen with Nginx, MySQL, and Memcached

![image](Lumen_splash.png)

### Configuration

There are two configurations using `.env` files. One `.env` file for docker-compose.yaml and another for the php application.

```sh
# copy both files and make changes to them if needed
cp .env.docker.example .env
cp .env.app.example images/php/app/.env
```

To change configuration values, look in the `docker-compose.yml` file and change the `php` container's environment variables. These directly correlate to the Lumen environment variables.

## Docker Setup

### [Docker for Mac](https://docs.docker.com/docker-for-mac/)

### [Docker for Windows](https://docs.docker.com/docker-for-windows/)

### [Docker for Linux](https://docs.docker.com/engine/installation/linux/)

### Build & Run

1. `$ git clone https://github.com/tjphippen/luminod && cd luminod && bash create.sh`
2. Have a beer! :beer:

Navigate to [http://localhost:80](http://localhost:80) and you should see something like this
![image](Lumen_browser.png)

Success! You can now start developing your Lumen app on your host machine and you should see your changes on refresh! Classic PHP development cycle. A good place to start is `images/php/app/routes/web.php`.

Feel free to configure the default port 80 in `docker-compose.yml` to whatever you like.

### Stop Everything

```bash
docker-compose down
```

## Running Artisan commands

```sh
docker-compose exec php sh
# inside the container
cd ..
php artisan migrate
php artisan cache:clear
```

## Contribute

Submit a Pull Request!

## Dev To-Do:
1. bash prompts for .env vars(passwords)
2. generate app Key
3. Add Vue App container
4. Add SSL Cert
5. Add `rabbitmq` container
6. Add API Gateway

---
