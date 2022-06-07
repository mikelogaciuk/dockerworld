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

db = db.getSiblingDB('erp')

db.createUser({
  user: 'erp',
  pwd: '$ERP_PASSWORD',
  roles: [{ role: 'readWrite', db: 'erp' }],
});
db.createCollection('comarch')
db.createCollection('microsoft')
db.createCollection('forcom')

db = db.getSiblingDB('preerp')

db.createUser({
  user: 'preerp',
  pwd: '$PREERP_PASSWORD',
  roles: [{ role: 'readWrite', db: 'preerp' }],
});
db.createCollection('terg')

EOF