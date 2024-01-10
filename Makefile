VOLUME_USED := $(shell docker volume ls -q)
DB_DIR = /home/cshi-xia/data/db
WP_DIR = /home/cshi-xia/data/wp

all: up

up:
	@mkdir -p /home/cshi-xia/data/db 
	@mkdir -p /home/cshi-xia/data/wp
	@docker compose -f ./srcs/docker-compose.yaml up

down:
	@docker compose -f ./srcs/docker-compose.yaml down

clean: down
	@echo "Cleaning all images and container"
	@docker system prune -af

fclean: clean
	@echo "Cleaning volumes"
	docker volume rm $(VOLUME_USED)

nuke:
	@echo "Cleaning Directories"
	rm -rf $(DB_DIR)/*
	rm -rf $(WP_DIR)/*

re: fclean up

.PHONY: up down clean fclean nuke re
