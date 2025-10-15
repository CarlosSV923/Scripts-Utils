# Preparar ambas VMs (master y worker)
# Realizar en cada nodo / vm

# 1. Actualiza paquetes
sudo apt update && sudo apt upgrade -y

# 2. Desactiva swap (Kubernetes no funciona con swap activa)
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

# 3. Habilita módulos de red
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# 4. Ajusta parámetros de red
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
