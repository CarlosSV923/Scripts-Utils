# Instalar un provisioner de almacenamiento local (recomendado para tu laboratorio)
# Esto permitirá que Kubernetes cree automáticamente los volúmenes para tus PVCs.
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

# Luego márcalo como predeterminado:
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# Verifica que el StorageClass se haya creado correctamente
kubectl get storageclass