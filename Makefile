DOCKER_DIR = ./srcs/requirements

NGINX_DIR = "$(DOCKER_DIR)/nginx"

WORDPRESS_DIR = "$(DOCKER_DIR)/wordpress"

MARIADB_DIR = "$(DOCKER_DIR)/mariadb"

all: nginx wordpress mariadb

nginx:
	docker build ${NGINX_DIR} -t $@

wordpress:
	docker build ${WORDPRESS_DIR} -t $@

mariadb:
	docker build ${MARIADB_DIR} -t $@

clean:
	docker image rm nginx wordpress mariadb -f
