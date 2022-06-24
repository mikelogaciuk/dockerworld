# dagster

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

And edit to your needs.

If no .env copy given, script will use default passwords.

## Preparation

Folders creation:

```shell
mkdir dagster_pgadmin_data && sudo chown -R 5050:5050 dagster_pgadmin_data
```

## Building

In order to build image with its all dependencies you need to run:

```shell
docker compose build
```

## Deployment

In order to start stack, type:

```shell
docker compose up -d
```

## Use

In order to view UI, log into [http://localhost:3000](http://localhost:3000).

In order stop/start stack:

```shell
docker compose stop
docker compose start
```

In order to remove stack:

```shell
docker compose down
```

In order to remove stack, volumes and data, type:

```shell
docker compose down -v && sudo rm -r dagster_data dagster_home dagster_pgadmin_data dagster_postgres_data
```
