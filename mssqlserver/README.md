# mssqlserver

## Preparation

To build, prepare `.ENV` by copying it from:

```shell
cd mssqlserver

cp .env.sample .env
```

Note that `$MSSQL_ADMIN_PWD` reads password stored in `MSSQL_ADMIN_PWD`in `.env`.

If not given, compose will use default password from `docker-compose.yml`.

## Build & run

Then:

```shell
docker compose up -d
```

To stop or run:

```shell
docker compose stop
docker compose start
```

To purge:

```shell
docker compose down -v
```
