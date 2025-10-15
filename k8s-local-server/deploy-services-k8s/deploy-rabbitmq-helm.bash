# Deploy RabbitMQ using Helm
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq \
    --namespace brokers \
    --set auth.username=csesme \
    --set auth.password=S3sm3V3r@0923 \
    --set auth.existingSecret=rabbitmq-secret \
    --set persistence.enabled=true \
    --set persistence.size=5Gi \
    --set resources.requests.memory=512Mi \
    --set resources.requests.cpu=250m \
    --set resources.limits.memory=1Gi \
    --set resources.limits.cpu=500m

# actualizacion de tipo de servicio a nodeport y puerto
kubectl patch svc rabbitmq -n brokers \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 5672, "targetPort": 5672, "nodePort": 30072}, {"port": 15672, "targetPort": 15672, "nodePort": 30073}, {"port": 25672, "targetPort": 25672, "nodePort": 30074}, {"port": 4369, "targetPort": 4369, "nodePort": 30075}]}}'

# uninstall
helm uninstall rabbitmq --namespace brokers

# check pod status
kubectl get pods --namespace brokers

# check service status
kubectl get svc --namespace brokers

# port-forward to access RabbitMQ
kubectl port-forward --namespace brokers svc/rabbitmq 5672:5672
