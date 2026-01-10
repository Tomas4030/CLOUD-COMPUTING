set -e

echo "🧹 Deleting database resources..."
kubectl delete -f database/ --ignore-not-found

echo "🧹 Deleting backend resources..."
kubectl delete -f backend/ --ignore-not-found

echo "🧹 Deleting frontend resources..."
kubectl delete -f frontend/ --ignore-not-found

echo "🧹 Deleting ingress..."
kubectl delete -f ingress/ --ignore-not-found

echo "🧹 Resetting Minikube..."
minikube delete

echo "✅ Cleanup complete"
