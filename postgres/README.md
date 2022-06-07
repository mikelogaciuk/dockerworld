# postgres

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

And edit to your needs.

If no .env copy given, script will use default passwords.

## Deployment

In order to use it, type:

```shell
docker compose --env-file ./.env up
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
