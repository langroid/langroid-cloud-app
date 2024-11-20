.PHONY: build run stop clean

CONTAINER_NAME = langroid-container

build:
	docker build -t langroid-app .

run:
	docker run -d --name $(CONTAINER_NAME) -p 7860:7860 langroid-app

stop:
	docker stop $(CONTAINER_NAME) 2>/dev/null || true

clean: stop
	docker rm $(CONTAINER_NAME) 2>/dev/null || true
	docker rmi langroid-app 2>/dev/null || true