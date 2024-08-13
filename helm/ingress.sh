helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install --namespace ingress-nginx ingress-nginx ingress-nginx/ingress-nginx
