DOCKER := docker compose
ENV := --env-file _.env
FILES := --file docker-compose.main.yml

FLAGS := ${ENV} ${FILES}
IMAGES := $(shell ${DOCKER} ${FLAGS} images -q)

setup-env:
	 shell grep -v '^#' _.env | xargs export
docker-up:
	${DOCKER} ${FLAGS} up -d --build
docker-down:
	${DOCKER} ${FLAGS} down
docker-rmi:
	-${DOCKER} ${FLAGS} down
	-docker rmi -f ${IMAGES}

docker-stop:
	-docker stop $(shell docker ps -a -q)
	-docker rm $(shell docker ps -a -q)
docker-clear:
	-docker stop $(shell docker ps -a -q)
	-docker rm $(shell docker ps -a -q)
	-docker rmi -f $(shell docker images -aq)
	-docker volume rm $(shell docker volume ls -q)

scripts-create:	
	echo "${DOCKER} ${FLAGS} up -d --build" >> up.sh
	echo "${DOCKER} ${FLAGS} down" >> down.sh
scripts-rm:
	rm down.sh
	rm up.sh