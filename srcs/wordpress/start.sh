nginx
php-fpm7

# This will get the external IP for this container.
APISERVER=https://kubernetes.default.svc
# SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

# Install WordPress
cd www/
wp config create --dbname=wordpress --dbuser=mysql --dbpass=mysql --dbhost=mysql
wp db create
wp core install --url=${URL}:5050 --title=Wordpress --admin_user=merel --admin_password=strawberry --admin_email=merelmourik@gmail.com --skip-email
wp user create Helen helen@example.com --user_pass=helen123 --role=subscriber
wp user create Hary hary@example.com --user_pass=hary123 --role=subscriber
wp user create Hank hank@example.com --user_pass=hank123 --role=editor

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

# deze is nu letterlijk overgenomen!!