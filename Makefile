VOLUME_USED := $(shell docker volume ls -q)
DB_DIR = /home/cshi-xia/data/db
WP_DIR = /home/cshi-xia/data/wp
ADMIN_DIR = /home/cshi-xia/data/admin

all: build up

build:
	@echo "Building Images ..."
	@echo "Creating data folders ..."
	@mkdir -p $(DB_DIR)
	@mkdir -p $(WP_DIR)
	@mkdir -p $(ADMIN_DIR)
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
	@rm -rf $(ADMIN_DIR)/*
	@echo "Done!"

re: down build up

.PHONY: up down clean fclean nuke re
