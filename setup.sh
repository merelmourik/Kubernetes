# deleting the current minikube, if it exists
minikube delete

# starting minikube's original driver, which is virutalbox
minikube start --driver=virtualbox \
                --cpus=2 --memory=2048 --disk-size=10g \
                --addons metallb \
                --addons dashboard

# enabling MetalLB and kubernetes dashboard
# minikube addons enable metallb
# minikube addons enable dashboard

# preparing MetalLB
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/config.yaml

# connecting to the docker environment that is running in the cluster
eval $(minikube docker-env)

# building my phpmyadmin image
docker build -t myphpmyadmin ./srcs/phpmyadmin

# adding the phpmyadmin.yaml file to deploy the myphpmyadmin container
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# adding the worpress.yaml file to deploy mywordpress container
# kubectl apply -f ./srcs/wordpress/wordpress.yaml

# adding the mysql.yaml file to deploy mysql container
# kubectl apply -f ./srcs/mysql/mysql.yaml

# adding the phpmyadmin.yaml file to deploy phpmyadmin container

# kubectl apply -f ./srcs/nginx/nginx.yaml