## Pod Node

Easy container to use as a Kubernetes node. Usage:
```bash
# Create pod node
kubectl apply -n my-namespace -f https://raw.githubusercontent.com/FabianKramm/pod-node/refs/heads/main/deploy/node.yaml

# Exec into pod
kubectl exec -it -n my-namespace pod-node -- bash

# Install required tools (containerd, kubelet etc.) and prepare host
curl -sfL https://raw.githubusercontent.com/loft-sh/init-node/main/init.sh | sh -s -- --kubernetes-version v1.32.1

# Join the pod into a cluster
kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>
```
