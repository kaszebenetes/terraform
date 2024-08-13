helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# https://github.com/prometheus-community/helm-charts/blob/main/charts/kube-prometheus-stack/values.yaml
helm install prometheus-stack prometheus-community/kube-prometheus-stack

helm upgrade prometheus-stack prometheus-community/kube-prometheus-stack -f values.yaml
