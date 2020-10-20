# deleting the current minikube, if it exists
minikube delete

# starting minikube's original driver, which is virutalbox
minikube start --driver=virtualbox

# enabling MetalLB and kubernetes dashboard
minikube addons enable metallb
minikube addons enable dashboard

# preparing MetalLB
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/config_metallb.yaml

# connecting to the docker environment that is running in the cluster
eval $(minikube docker-env)