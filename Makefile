COMPOSE_FILE = srcs/docker-compose.yml

all:
	docker compose --parallel 4 -f ${COMPOSE_FILE} --env-file ./srcs/.env build
	docker compose -f ${COMPOSE_FILE} --env-file ./srcs/.env up

clean:
	docker compose -f ${COMPOSE_FILE} down
	docker system prune -a
	docker volume prune -a
	-docker volume rm $$(docker volume ls -qf dangling=true)

re:
	@${MAKE} clean
	@${MAKE} all
