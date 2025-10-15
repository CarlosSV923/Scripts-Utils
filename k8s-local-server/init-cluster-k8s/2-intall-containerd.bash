

# Instalar contenedor runtime (containerd)
# Realizar en cada nodo / vm

# 1. Instalar containerd
sudo apt install -y containerd

# 2. Configurar containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# 3. Edita config.toml y cambia el runtime a SystemdCgroup
# Usar el editor que se prefiera como nano
sudo vim /etc/containerd/config.toml
# Busca: [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
# Cambia: SystemdCgroup = false → SystemdCgroup = true

# 4. Reinicia
sudo systemctl restart containerd
sudo systemctl enable containerd

# 5. Verifica que containerd esté corriendo
sudo systemctl status containerd