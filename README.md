# bigsdb-docker
Dockerized BIGSdb

## Components

### bigsdb-web
Container running the bigsdb web server. 

### bigsdb-postgres
Postgres 11 container serving bigsdb databases.

## Development

Requirements:
* docker
* docker-compose
* make

### Building
```
make build
```

### Running
```
make run
```