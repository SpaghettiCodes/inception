up:
	@docker compose -f ./srcs/docker-compose.yaml up

down:
	@docker compose -f ./srcs/docker-compose.yaml down

clean: down
	@echo "Cleaning all images and containers"
	@docker system prune -af

fclean: clean
	@echo "Cleaning volumes"
	@docker volume prune -af
