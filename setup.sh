# deleting the current minikube, if it exists
minikube delete

# starting minikube's original driver, which is virutalbox and
minikube start --driver=virtualbox \
                --cpus=2 --memory=2048 --disk-size=10g \
                --addons metallb \
                --addons dashboard

# enabling MetalLB and kubernetes dashboard

# preparing MetalLB
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/config.yaml

# connecting to the docker environment that is running in the cluster
eval $(minikube docker-env)

# creating my service account
kubectl create serviceaccount mmourik
kubectl apply -f srcs/service_account.yaml

# building my mysql image and as
docker build -t mysql ./srcs/mysql
# adding the mysql.yaml file to deploy mysql container
kubectl apply -f ./srcs/mysql/mysql.yaml

# # building my phpmyadmin image
docker build -t phpmyadmin ./srcs/phpmyadmin

# # adding the phpmyadmin.yaml file to deploy the myphpmyadmin container
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# building my wordpress image
docker build -t wordpress ./srcs/wordpress

# adding the worpress.yaml file to deploy mywordpress container
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# docker build -t mynginx ./srcs/nginx
# kubectl apply -f ./srcs/nginx/nginx.yaml

# adding the phpmyadmin.yaml file to deploy phpmyadmin container
# kubectl apply -f ./srcs/nginx/nginx.yaml