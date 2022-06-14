# apache-airflow

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

If not given, will use default passwords from `docker-compose.yml` on its own.

## Deployment

First, you need to build image:

```shell
docker compose build
```

Then init database:

```shell
docker compose up airflow-init
```

Then:

```shell
mkdir logs && sudo chmod -R 777 logs/
docker compose up -d
```

To check if everything is up and running, type:

```shell
docker compose ps
```

And you should see something like this with healthy containers:

```shell
$ docker compose ps

NAME                                 COMMAND                  SERVICE             STATUS              PORTS
apache-airflow-airflow-init-1        "/bin/bash -c 'funct…"   airflow-init        exited (0)
apache-airflow-airflow-scheduler-1   "/usr/bin/dumb-init …"   airflow-scheduler   running (healthy)   8080/tcp
apache-airflow-airflow-triggerer-1   "/usr/bin/dumb-init …"   airflow-triggerer   running (healthy)   8080/tcp
apache-airflow-airflow-webserver-1   "/usr/bin/dumb-init …"   airflow-webserver   running (healthy)   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp
apache-airflow-airflow-worker-1      "/usr/bin/dumb-init …"   airflow-worker      running (healthy)   8080/tcp
apache-airflow-postgres-1            "docker-entrypoint.s…"   postgres            running (healthy)   5432/tcp
apache-airflow-redis-1               "docker-entrypoint.s…"   redis               running (healthy)   6379/tcp
```

## Access

In order to access webserver, drive to [url](http://localhost:8080/):

```xd
http://localhost:8080/
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

Then clean the additional folders:

```shell
sudo rm -r dags logs plugins
```

## Notes

Default `apache-airflow` image doesn't contain special providers like Oracle or MSSQL.

In order to use it, you need to build own image and use it in compose.

Though I provided custom dockerfile that builds custom image containing providers such as:

```requirements
psycopg2-binary
cx_Oracle
cassandra-driver
dnspython
pymongo
sqlalchemy
pandas
numpy
pymssql
pyodbc
apache-airflow-providers-odbc
apache-airflow-providers-cncf-kubernetes
apache-airflow-providers-docker
apache-airflow-providers-apache-spark
apache-airflow-providers-apache-cassandra
apache-airflow-providers-microsoft-mssql
apache-airflow-providers-microsoft-azure
apache-airflow-providers-postgres
apache-airflow-providers-oracle
apache-airflow-providers-elasticsearch
apache-airflow-providers-mongo
apache-airflow-providers-mysql
```

In order to use clean image from docker hub, comment:

```yaml
build .
```

And uncomment:

```yaml
 # image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:latest}
```

## Custom connections

Sometimes you need to override default provider settings e.g. use `pymssql` instead of `pyodbc`.

For this, you need to invoke in `docker-compose` an ENV from `.env` with proper setup and export it during startup.

Then you need to refer it in DAG using your ENV_NAME.

Example based on `.env.sample`:

```yaml
AIRFLOW_CONN_MSSQL_CUST1=mssql+pymssql://DOMAIN\\USER:PASSWORD@SERVER
```

And in `docker-compose`:

```yaml
version: '3'
x-airflow-common:
  # In order to add custom dependencies or upgrade provider packages you can use your extended image.
  # Comment the image line, place your Dockerfile in the directory where you placed the docker-compose.yaml
  # and uncomment the "build" line below, Then run `docker-compose build` to build the images.

  # image: ${AIRFLOW_IMAGE_NAME:-apache/airflow:latest}
  &airflow-common
  build: .
  environment:
    &airflow-common-env
    (...)
    AIRFLOW_CONN_MSSQL_CUST1: ${AIRFLOW_CONN_MSSQL_CUST1}
```
