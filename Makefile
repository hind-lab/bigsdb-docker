build:
	docker-compose build

clean:
	docker-compose down -v

run: build
	docker-compose up -d