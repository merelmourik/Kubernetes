# FTPS is the same as FTP but it uses SSL to protect the FTP. 
# FTP is used for file exchange between computers. One computer 
# is the FTP server and the other one is the client.

# building from Alpine Linux
FROM alpine:3.12

# updating the packagelist and installing the necessary packages
RUN apk update && \
	apk add vsftpd && \
	apk add vim && \
	apk add openssl && \
	apk add jq && \
	apk add curl

# creating a folder for the new user for FTP
RUN mkdir -p /ftps/mmourik

# creating a new user in the correct map
RUN adduser -h /ftps/mmourik -D mmourik && \
	echo "mmourik:strawberry" | chpasswd

# creating new key and ssl certificate and putting them in the right directory
RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=NL/ST=Noord-Holland/O=Codam/CN=localhost.com" -newkey rsa:2048 -keyout \
	/etc/ssl/private/ftps.key -out /etc/ssl/certs/ftps.crt;

# copying the vsftpd configuration file and the start script to the corerct directory
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh ./start.sh

# giving the script the right rights
RUN chmod +x /start.sh

# exposing port 20 for the data and 21 for the command(control)
EXPOSE 20 21 10003 10004 10005

# exposing  passive ports; passive ports are used to solve the problem of firewalls filtering
# the incoming data port connection to the client from the server
# EXPOSE 10003 10004 10005

# running the starts script
CMD ./start.sh
