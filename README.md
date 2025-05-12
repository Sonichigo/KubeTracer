# eBPF Based Kubernetes Monitoring
A security monitoring solution to monitor system events on your cluster nodes. By combining eBPF-based kernel tracing with periodic system audits in a lightweight DaemonSet, this solution offers proactive node-level security monitoring for Kubernetes clusters. It enables visibility into key events such as unauthorized process execution, privilege escalations, and suspicious mount or module activity without intrusive agents or heavyweight tools.

The modular architecture ensures ease of deployment and scalability across clusters of any size. Whether you're securing a production environment or auditing development clusters, this observability pipeline adds a powerful layer of defense.

## Architecture
![Architecture](../main.svg)

Our security monitoring solution consists of four main components working together to detect, collect, and expose security-relevant events:

1. Security Monitor DaemonSet: Runs on each node to capture kernel events via kprobes and perform regular system scans
2. Monitoring Script ConfigMap: Houses the shell script that sets up kprobes and logs findings
3. Metrics Exporter Deployment: A Python container that processes events and exposes Prometheus metrics
4. ClusterIP Service: Allows Prometheus to scrape the exporter endpoints

Read More: [eBPF-based K8s Monitoring](https://blog.sonichigo.com/building-a-node-level-security-monitoring-pipeline)

## Prerequisites
- Kubernetes cluster
- kubectl

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/sonichigo/ebpf-k8s-monitoring.git
   cd ebpf-k8s-monitoring
   ```
2. Apply the Kubernetes manifests:
   ```bash
   bash k8s.sh
   ```
3. Verify the installation:
   ```bash
   kubectl get pods -n monitoring
   ```
4. Check the logs of the DaemonSet:
   ```bash
   kubectl logs -n monitoring -l app=security-monitor -f
   ```
