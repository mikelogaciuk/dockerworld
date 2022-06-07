# redash

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

And edit to your needs.

If no password given, script will use defaults from `docker-compose.yml`.

## Deployment

In order to use it, type:

```shell
docker compose run --rm server create_db

docker compose up -d
```

## Management

For management, visit:

```shell
http://localhost:5000/
```

## Stopping

To stop, just type:

```shell
docker compose stop
```

## Cleaning

In order to delete volumes and stop containers, use:

```shell
docker compose down -v
```
