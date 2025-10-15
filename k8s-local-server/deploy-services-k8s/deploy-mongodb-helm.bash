# Deploy MongoDB using Helm
helm install mongodb oci://registry-1.docker.io/bitnamicharts/mongodb \
    --namespace databases \
    --set architecture=standalone \
    --set auth.username=csesme \
    --set auth.password=S3sm3V3r@0923 \
    --set auth.database=db_default \
    --set persistence.enabled=true \
    --set persistence.size=5Gi \
    --set primary.resources.requests.memory=512Mi \
    --set primary.resources.requests.cpu=250m \
    --set primary.resources.limits.memory=1Gi \
    --set primary.resources.limits.cpu=500m

# actualizacion de tipo de servicio a nodeport y puerto kubectl patch svc mongodb -n databases \
kubectl patch svc mongodb -n databases \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 27017, "targetPort": 27017, "nodePort": 30017}]}}'

# uninstall
helm uninstall mongodb --namespace databases

# check pod status
kubectl get pods --namespace databases

# check service status
kubectl get svc --namespace databases

# port-forward to access MongoDB
kubectl port-forward --namespace databases svc/mongodb 27017:27017


