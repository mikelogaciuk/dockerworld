# apache-airflow

## Setup

Copy example `.env` file:

```shell
copy ".env.sample" ".env"
```

If not given, will use default passwords from `docker-compose.yml` on its own.

## Deployment

In order to use it, type:

```shell
docker compose up -d
```

If everything is okey, you should see something like this:

```shell
[+] Running 7/7
 ⠿ Container apache-airflow-redis-1              Healthy                                                                                                                                                 1.4s
 ⠿ Container apache-airflow-postgres-1           Healthy                                                                                                                                                 1.4s
 ⠿ Container apache-airflow-airflow-init-1       Exited                                                                                                                                                  9.9s
 ⠿ Container apache-airflow-airflow-webserver-1  Running                                                                                                                                                 0.0s
 ⠿ Container apache-airflow-airflow-worker-1     Running                                                                                                                                                 0.0s
 ⠿ Container apache-airflow-airflow-triggerer-1  Running                                                                                                                                                 0.0s
 ⠿ Container apache-airflow-airflow-scheduler-1  Running                                                                                                                                                 0.0s
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
