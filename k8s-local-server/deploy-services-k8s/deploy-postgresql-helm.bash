
# Deploy PostgreSQL with Helm
helm install postgres oci://registry-1.docker.io/bitnamicharts/postgresql \
  --namespace databases \
  --create-namespace \
  --set auth.postgresPassword=S3sm3V3r@0923 \
  --set primary.persistence.enabled=true \
  --set primary.persistence.size=5Gi \
  --set primary.resources.requests.memory=512Mi \
  --set primary.resources.requests.cpu=250m \
  --set primary.resources.limits.memory=1Gi \
  --set primary.resources.limits.cpu=500m \

# Agregar para generar réplicas
  # --set replication.enabled=true \ 
  # --set replication.slaveReplicas=1 \

# uninstall PostgreSQL with Helm
helm uninstall postgres --namespace databases

# check pod status
kubectl get pods --namespace databases

# connect to PostgreSQL
kubectl port-forward --namespace databases svc/postgresql 5432:5432

# actualizacion de tipo de servicio a NodePort en caso de ser necesario y seteo de puerto
kubectl patch svc postgresql -n databases \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 5432, "targetPort": 5432, "nodePort": 32345}]}}'


# verificar el cambio de tipo de servicio
kubectl get svc postgresql --namespace databases