version: "2"
services:
  web:
    image: nginx
    ports:
      - "80:80"
    restart: always
    volumes:
      - ../app:/www/web
      - /var/docker-worspace/docker-app/env/services/web/nginx/conf:/etc/nginx
      - /var/docker-worspace/docker-app/data/web/nginx/web_logs:/www/web_logs
    networks:
      - code-network
    depends_on:
      - php
  mysql:
    image: mysql:5.7
    ports:
      - "3306:3306"
    restart: always
    volumes:
      - /var/docker-worspace/docker-app/env/services/mysql/conf.d:/etc/mysql/conf.d
      - /var/docker-worspace/docker-app/env/services/mysql/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d
      - /var/docker-worspace/docker-app/data/mysql/data:/var/lib/mysql
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=myzero1&735
      - MYSQL_DATABASE=yii2advanced
    networks:
      - code-network
  php:
    image: fecshop/php-fpm-7.1.13
    restart: always
    volumes:
      - ../app:/www/web
      - /var/docker-worspace/docker-app/env/services/php/etc/php7.1.13.ini:/usr/local/etc/php/conf.d/php7.1.13.ini
    depends_on:
      - mongodb
      - mysql
    networks:
      - code-network
  mongodb:
    image: mongo:latest
    restart: always
    environment:
      - MONGO_DATA_DIR=/data/db
      - MONGO_LOG_DIR=/data/logs
    volumes:
      - /var/docker-worspace/docker-app/data/mongodb/db:/data/db
      - /var/docker-worspace/docker-app/data/mongodb/logs:/data/logs
      - /var/docker-worspace/docker-app/env/services/mongodb/example_db:/data/example_db
    networks:
      - code-network
  redis:
    image: redis
    restart: always
    environment:
        REDIS_PASS_FILE: /run/secrets/redis-password
    command: [
      "bash", "-c",
      '
       docker-entrypoint.sh
       --requirepass "$$(cat $$REDIS_PASS_FILE)"
      '
    ]
    volumes:
      - /var/docker-worspace/docker-app/env/services/redis/etc/redis.conf:/usr/local/etc/redis/redis.conf
      - /var/docker-worspace/docker-app/env/services/redis/etc/redis-password:/run/secrets/redis-password
      - /var/docker-worspace/docker-app/data/redis/data:/data
    networks:
      - code-network
networks:
  code-network:
    driver: bridge
