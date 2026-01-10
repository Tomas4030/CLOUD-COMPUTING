set -e

echo "🚀 Starting DB deployment"
echo "💾 Creating Postgres Secret..."
kubectl create secret generic postgres-secret --from-env-file=.env.postgres --dry-run=client -o yaml | kubectl apply -f -

echo "📦 Creating PVC..."
kubectl apply -f ./infra/database/db-pvc.yaml

echo "🛠️ Creating Postgres StatefulSet..."
kubectl apply -f ./infra/database/db-StatefulSet.yaml

echo "🔗 Creating Postgres Service..."
kubectl apply -f ./infra/database/db-service.yaml

echo "⏳ Waiting for Postgres to become Ready..."
kubectl wait --for=condition=Ready pod -l app=postgres --timeout=120s

echo "✅ Database is ready"

echo "🚀 Starting Backend deployment..."

echo "💾 Creating Backend Secret..."
kubectl create secret generic app-secret --from-env-file=.env.app --dry-run=client -o yaml | kubectl apply -f -

echo "📦 Creating Backend Deployment..."
kubectl apply -f ./infra/backend/deployment.yaml

echo "🔗 Creating Backend Service..."
kubectl apply -f ./infra/backend/service.yaml

echo "⏳ Waiting for Backend to become Ready..."
kubectl wait --for=condition=Ready pod -l app=backend --timeout=120s

echo "✅ Backend is ready"
