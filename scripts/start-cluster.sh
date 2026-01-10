set -e

echo "🚀 Starting Minikube..."
minikube start --driver=docker 

echo "🔧 Enabling addons..."
minikube addons enable ingress
minikube addons enable metrics-server
minikube addons enable default-storageclass

echo "✅ Minikube started and addons enabled"
kubectl config current-context
