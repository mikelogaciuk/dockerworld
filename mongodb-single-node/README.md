# mongodb-single-node

## Preparation

To build, prepare `.ENV` by copying it from:

```shell
cd mongodb-single-node

cp .env.sample .env
```

And copy default `sample-mongo-init.sh` as `mongo-init.sh` and edit depending on your needs:

```shell
cp sample-mongo-init.sh mongo-init.sh
```

E.g.:

```shell
set -e

mongo <<EOF
db = db.getSiblingDB('stores')

db.createUser({
  user: 'stores',
  pwd: '$STORES_PASSWORD',
  roles: [{ role: 'readWrite', db: 'stores' }],
});
db.createCollection('sales')
db.createCollection('documents')
db.createCollection('closedayprocessing')
EOF
```

Note that `$STORES_PASSWORD` reads password stored in `STORES_PASSWORD`in `.env`.

With this, you can create multiple databases depending on your personal needs.

If not given, compose will use default password from `docker-compose.yml`.

## Build & run

Then:

```shell
docker compose up -d
```

To stop:

```shell
docker compose stop
```

To purge:

```shell
docker compose down -v
```
