set -e

echo "🔍 Checking pods..."
kubectl get pods

echo "🔍 Checking services..."
kubectl get svc

echo "🔍 Testing connection to Postgres..."
kubectl run -i --rm --tty pg-test --image=postgres \
  --env="PGHOST=postgres-0.postgres" \
  --env="PGUSER=user" \
  --env="PGPASSWORD=password" \
  --env="PGDATABASE=db" \
  -- bash -c "psql -c '\l'" || echo "Could not connect to Postgres"
