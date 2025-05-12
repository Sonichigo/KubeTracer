kubectl create namespace monitoring
kubectl apply -f k8s/ebpf-script.yml
kubectl apply -f k8s/ebpf-script-configmap.yml