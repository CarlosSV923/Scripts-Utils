# Inicializar el clúster (solo en el master)

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Apunta la salida, porque te dará un kubeadm join ... para unir los workers.
# Configura kubectl para el usuario actual:
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Aplicar la red de superposición (Flannel)
# Una red de superposición permite que los pods se comuniquen entre sí, incluso si están en nodos diferentes.
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
