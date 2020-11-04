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
wp config create --dbname=wordpress --dbuser=mysql --dbpass=strawberry --dbhost=mysql-service
wp db create
wp core install --url=${URL}:5050 --title=Wordpress --admin_user=mmourik --admin_password=strawberry --admin_email=mpeerdem@student.codam.nl --skip-email
wp user create Helen helen@example.com --user_pass=helen123 --role=subscriber
wp user create Hary hary@example.com --user_pass=hary123 --role=subscriber
wp user create Hank hank@example.com --user_pass=hank123 --role=editor

# making sure that the container stops whem one of his components stop
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
