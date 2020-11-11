php-fpm7
cd www
wp db create

APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null | jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

wp core install --title=Wordpress --admin_user=rixt --admin_password=secret --admin_email=rde-vrie@student.codam.nl --skip-email --url=192.168.99.220:5050

wp user create remco rpet@student.codam.nl --user_pass=kaaskip 

wp user create mark mpeerdem@student.codam.nl --user_pass=vlasaus 

wp user create boris bpeeters@student.codam.nl --user_pass=bigb 

nginx

while true; do
	echo "sup bitchez"
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php | grep fpm
	if [ $? == 1 ]; then break
	fi
done
