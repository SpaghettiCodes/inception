VOLUME_USED := $(shell docker volume ls -q)
DB_DIR = /home/cshi-xia/data/db
WP_DIR = /home/cshi-xia/data/wp

all: build up

build:
	@echo "Building Images ..."
	@echo "Creating data folders ..."
	@mkdir -p /home/cshi-xia/data/wp
	@mkdir -p /home/cshi-xia/data/db 
	@mkdir -p /home/cshi-xia/data/ftp
	@echo "Done!"
	docker compose -f ./srcs/docker-compose.yaml build

up:
	@echo "Bringing the containers up ..."
	@docker compose -f ./srcs/docker-compose.yaml up

down:
	@echo "Bringing down the containers ..."
	@docker compose -f ./srcs/docker-compose.yaml down --volumes
	@echo "Container's brought down, run make clean to remove images"

clean: down
	@echo "Cleaning all images and container"
	@docker system prune -af
	@echo "Cleaned!"

# fclean: clean
#	@echo "Cleaning volumes"
#	docker volume rm $(VOLUME_USED)
#	@echo "Done!"

nuke:
	@echo "Cleaning Directories"
	@rm -rf $(DB_DIR)/*
	@rm -rf $(WP_DIR)/*
	@echo "Done!"

re: down build up

.PHONY: up down clean fclean nuke re
