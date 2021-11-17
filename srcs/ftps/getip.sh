APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/ftps/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')
echo pasv_address=$URL >> /etc/vsftpd/vsftpd.conf
vsftpd /etc/vsftpd/vsftpd.conf
