# elastic-single-node

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

If not given, will use default passwords from `docker-compose.yml`.

## Deployment

In order to use it, type:

```shell
docker compose up -d
```

## Access

In order to access ELK/KIBANA, drive to [url](http://localhost:5601/login?next=%2F).


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
