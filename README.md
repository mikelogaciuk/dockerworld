# dockerworld

![Docker](./docker.jpg)

## Contents

- [Contents](#contents)
- [About](#about)
- [Usage](#usage)

## About

Docker images in a form of `dockerfiles` or `docker-compose` for development purposes.

## Usage

In order to build specific image, you should navigate to specific folders e.g. `postgres` and start it e.g.:

```shell
docker compose up
```

Or with `-d` flag:

```shell
docker compose up -d
```

Or for projects with built in .ENV:

```shell
docker compose --env-file ./.env up
```

In order to stop containers and remove volumes use:

```shell
docker compose down -v
```
