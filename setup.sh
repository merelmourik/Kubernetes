# deleting the current minikube, if it exists
minikube delete

# rm -rf ~/.minikube
# mkdir -p ~/goinfre/.minikube
# ln -s ~/goinfre/.minikube ~/.minikube

# starting minikube's original driver, which is virutalbox and enabling MetalLB and kubernetes' dashboard
minikube start 	--driver=virtualbox \
                --cpus=2 --memory=2048 --disk-size=10g \
                --addons metallb \
                --addons dashboard

# MINIKUBE_IP="$(minikube ip)"

# sed -i "" "s/__MINIKUBE_IP__/$MINIKUBE_IP/g"    srcs/ftps_pt/Dockerfile

# preparing MetalLB
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

# connecting to the docker environment that is running in the cluster
eval $(minikube docker-env)

# creating my service account
kubectl create serviceaccount mmourik	
kubectl apply -f srcs/service_account.yaml

# # building my phpmyadmin image and deploying the container
# docker build -t phpmyadmin ./srcs/phpmyadmin
# kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# # building my nginx image and deploying the container
# docker build -t nginx ./srcs/nginx
# kubectl apply -f ./srcs/nginx/nginx.yaml

# building my ftps image and deploying the container
docker build -t ftps ./srcs/ftps_tix2
kubectl apply -f ./srcs/ftps_tix2/ftps.yaml

# # building my mysql image and deploying the container
# docker build -t mysql ./srcs/mysql
# kubectl apply -f ./srcs/mysql/mysql.yaml

# # building my wordpress image and deploying the container
# docker build -t wordpress ./srcs/wordpress
# kubectl apply -f ./srcs/wordpress/wordpress.yaml

# # building my influxdb image and deploying the container
# docker build -t influxdb ./srcs/influxdb
# kubectl apply -f ./srcs/influxdb/influxdb.yaml

# # building my telegraf image and deploying the container
# docker build -t telegraf ./srcs/telegraf
# kubectl apply -f ./srcs/telegraf/telegraf.yaml

# # building my grafana image and deploying the container
# docker build -t grafana ./srcs/grafana
# kubectl apply -f ./srcs/grafana/grafana.yaml

# service		user		password	db_name		hostname	db_charset
# Grafana:		admin		admin
# phpMyAdmin:	mysql		mysql
# Wordpress:	mysql		mysql		wordpress	mysql		utf8
# SSH: 			int the terminal "ssh mmourik@192.168.99.220 -p 22"
				# password: strawberry
