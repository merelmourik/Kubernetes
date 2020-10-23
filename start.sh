# adding the nginx.yaml file to deploy the mynginx container

minikube delete 
minikube start --driver=virtualbox \
                --cpus=2 --memory=2048 --disk-size=10g

kubectl apply -f ./srcs/nginx/nginx.yaml

# adding the mysql.yaml file to deploy mysql container
kubectl apply -f ./srcs/mysql/mysql.yaml

# adding the worpress.yaml file to deploy mywordpress container
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# adding the phpmyadmin.yaml file to deploy myphpmyadmin container
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
