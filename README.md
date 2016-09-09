# dockerfile-nginx-phpfpm


## docker install
[docker for mac](https://download.docker.com/mac/stable/Docker.dmg)

## setup
```sh
docker pull yjkim0/php-travis
docker run -d -v `pwd`:/var/www -p 3307:3306 -p 8000:80 --name php-travis yjkim0/php-travis
docker exec php-travis /bin/sh -c "cd /var/www; composer update"
docker exec php-travis /bin/sh -c "cd /var/www; ./vendor/bin/phpcs -sw --standard=PSR2 app"
docker exec php-travis /bin/sh -c "cd /var/www; ./vendor/bin/phpmd app text cleancode"
docker exec php-travis /bin/sh -c "cd /var/www; phpunit"

# docker bash connect
docker exec -it php-travis bash

```
