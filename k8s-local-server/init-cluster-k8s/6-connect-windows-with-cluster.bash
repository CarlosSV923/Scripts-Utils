# Configurar kubectl en tu máquina Windows

# Copia el archivo de configuración del master (admin.conf) a tu máquina Windows para poder usar

# En el master:
cat ~/.kube/config

# Copia el contenido de este archivo a tu máquina Windows en la ubicación correspondiente C:\Users\<usuario>\.kube\config
# Asegúrate de tener kubectl instalado en Windows y apunta al archivo
# en powershell:
kubectl --kubeconfig=C:\Users\<usuario>\.kube\config get nodes

# A futuro el comando que puedes usar para ver los pods
kubectl get pods
