# ebpf-k8s-monitoring
A security monitoring solution to monitor system events on your cluster nodes.

```bash
bash k8s.sh
kubectl port-forward -n monitoring svc/grafana 3000:3000
kubectl port-forward -n monitoring svc/prometheus 9090:9090
```