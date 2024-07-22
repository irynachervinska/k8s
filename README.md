Usefull commands:

docker network create mynet
docker build . -t song-db
docker run --name song-db --network mynet song-db
docker build . -t song-service
docker run -d -p 8080:8080 --name song-service --network mynet song-service

docker container logs


=================================

cat /etc/resolv.conf
sudo nano /etc/resolv.conf

generateResolvConf = false
nameserver 172.22.240.1
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 0.0.0.0

=================================

./start-k8s

kubectl config view
kubectl get ns
kubectl get all
kubectl config set-context --current --namespace=k8s-program

./gradlew bootBuildImage OR mvn spring-boot:build-image
docker build -t song-service:old .
minikube image load song-service:old
minikube image ls
docker build -t resource-service:old .
minikube image load resource-service:old
minikube image ls

kubectl config set-context --current --namespace=k8s-program
kubectl apply -f .
kubectl get pods
kubectl get all


kubectl port-forward service/song-service 8080:8080
kubectl port-forward service/resource-service 8081:8080

minikube service song-service --url -n k8s-program

kubectl delete all --all -n k8s-program

=============================================

kubectl exec -it song-db-0 -- bash
psql song user
\dt to view all tables
\dn to view all schemas

============================================

kubectl create secret generic app-secret \
    --from-literal=username=user \
    --from-literal=password='password'
	
kubectl get secrets
kubectl get secret app-secret -o jsonpath='{.data}'

kubectl describe pod liveness-exec
================================

kubectl set image deployment.apps/resource-service-deployment resource-service=docker.io/library/resource-service:latest
kubectl set image deployment.apps/song-service-deployment song-service=docker.io/library/song-service:latest

kubectl rollout status deployment.apps/resource-service-deployment
kubectl rollout status deployment.apps/song-service-deployment

kubectl rollout history deployment.apps/resource-service-deployment

kubectl rollout undo deployment.apps/resource-service-deployment --to-revision=1

=====================

kubectl create namespace k8s-program

helm install ms-app ./ms-app -f ./ms-app/values.yaml -n k8s-program
helm list -n k8s-program

helm uninstall ms-app --namespace k8s-program

===================================

kubectl get pods --namespace ingress-nginx -l app.kubernetes.io/name=ingress-nginx
