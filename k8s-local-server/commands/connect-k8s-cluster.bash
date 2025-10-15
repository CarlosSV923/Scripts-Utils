
# Join the cluster
kubeadm join 192.168.8.21:6443 --token string-token \
       --discovery-token-ca-cert-hash sha256:string-key



# Verify the cluster
kubectl get nodes

kubectl --kubeconfig=C:\Users\carlo\.kube\config get nodes
