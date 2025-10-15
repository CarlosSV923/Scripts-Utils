# Unir el workers al clúster

sudo kubeadm join 192.168.X.X:6443 --token abcdef.0123456789abcdef \
    --discovery-token-ca-cert-hash sha256:XXXXXXXXXXXX