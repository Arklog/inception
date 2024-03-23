COMPOSE_FILE = srcs/docker-compose.yml

all:
	docker compose --parallel 4 -f ${COMPOSE_FILE} up --build -d

clean:
	docker compose -f ${COMPOSE_FILE} down
	docker system prune -a
	docker volume prune -a
