MINIKUBE_IP='minikube ip'

sed -i '' s/__MINIKUBE_IP__/'$MINIKUBE_IP'/g		srcs/ftps_pt/Dockerfile
docker build -t ftps ./srcs/ftps_pt
