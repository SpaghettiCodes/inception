VOLUME_USED := $(shell docker volume ls -q)
HOME = /home/cshi-xia
DB_DIR = ${HOME}/data/db
WP_DIR = ${HOME}/data/wp
ADMIN_DIR = ${HOME}/data/admin
GIT_DIR = ${HOME}/data/git

all: dir build up

dir: 
	@echo "Creating Volume Directory ..."
	@mkdir -p $(DB_DIR)
	@mkdir -p $(WP_DIR)
	@mkdir -p $(GIT_DIR)
	@mkdir -p $(ADMIN_DIR)
	@echo "Done!"

build:
	@echo "Building Images ..."
	@echo "Creating data folders ..."
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
	@rm -rf "$(DB_DIR)"
	@rm -rf "$(WP_DIR)"
	@rm -rf "$(ADMIN_DIR)"
	@rm -rf "$(GIT_DIR)"
	@echo "Done!"

re: down build up

.PHONY: up down clean fclean nuke re
