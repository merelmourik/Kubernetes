ssh-keygen -A
/usr/sbin/sshd
nginx

# making sure that the container stops whem one of his components stop
while :
do
	sleep 10
	ps | grep nginx | grep master
	if [ $? == 1 ]
	then
		break
	fi
	ps | grep sshd | grep listener
	if [ $? == 1 ]
	then
		break
	fi
done