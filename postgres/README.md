# postgres

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

And edit to your needs.

If no .env copy given, script will use default passwords.

## Deployment

Preparation:

```shell
mkdir pgadmin_data && sudo chown -R 5050:5050 pgadmin_data
```

In order to start stack, type:

```shell
docker compose --env-file ./.env up -d

# or

docker compose up -d
```

## Stopping

To stop, just type:

```shell
docker compose stop
```

## Cleaning

In order to delete volumes and stop containers, use:

```shell
docker compose down -v && sudo rm -r pgadmin_data
```

## pgAdmin

Stack contains `pgAdmin` for server/cluster management through website.

Web version of pgAdmin is accessible via address: [http://localhost:5050](http://localhost:5050).

## Logging in

Defaults (if ENV is not given) are:

- admin@admin.com/admin for `pgAdmin`
- postgres@postgres/postgres for `database`
