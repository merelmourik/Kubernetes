nginx
php-fpm7

# This will get the external IP for this container.
APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

# Install WordPress
cd www/
wp config create --dbname=wordpress --dbuser=mysql --dbpass=mysql --dbhost=mysql
wp db create
wp core install --url=${URL}:5050 --title=Wordpress --admin_user=mmourik --admin_password=strawberry --admin_email=mpeerdem@student.codam.nl --skip-email
wp user create user1 user1@example.com --user_pass=pass --role=subscriber
wp user create user2 user2@example.com --user_pass=pass --role=subscriber
wp user create editor1 editor1@example.com --user_pass=pass --role=editor

# This will make sure the container closes if one of its components shuts down.
while :
do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]
	then
		break
	fi
	ps | grep php-fpm | grep master
	if [ $? == 1]
	then
		break
	fi
done
