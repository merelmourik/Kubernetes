# building from Alpine Linux
FROM alpine:3.12

# update the packagelist and install necessary packages
RUN apk update && \
	apk add vsftpd && \
	apk add openssl && \
	apk add jq && \
	apk add curl

# creating a folder for the new user for FTP
RUN mkdir -p /ftps/mmourik

# creating a new user in the correct map
RUN adduser -h /ftps/mmourik -D mmourik && \
	echo "mmourik:strawberry" | chpasswd

# creating new key and ssl certificate and putting them in the right directory
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=NL/ST=Amsterdam/O=Codam/CN=Kubernetes' -keyout /etc/ssl/ftps.key -out /etc/ssl/ftps.crt

# copying the vsftpd configuration file and the start script to the corerct directory
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /start.sh

# exposing port 20 for the data and 21 for the command(control)
EXPOSE 20 21 

# exposing a passive port; passive ports are used to solve the problem of firewalls filtering
# the incoming data port connection to the client from the server
EXPOSE 30000

# giving the script the right rights
RUN chmod +x /start.sh

# running the starts script
CMD ./start.sh
