# FTPS is the same as FTP but it uses SSL to protect the FTP. 
# FTP is used for file exchange between computers. One computer 
# is the FTP server and the other one is the client.

# building from Alpine Linux
FROM alpine:latest

# updating the packagelist and installing the necessary packages
RUN apk update && \
	apk add vsftpd && \
	apk add vim && \
	apk add openssl && \
	apk add jq && \
	apk add curl

# creating a folder for the new user for FTP
RUN mkdir -p ftps/mmourik

# creating a new user in the correct map
RUN adduser -h /ftps/mmourik -D mmourik
RUN echo "mmourik:strawberry" | chpasswd

# creating new key and ssl certificate and putting them in the right directory
RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=NL/ST=Noord-Holland/O=Codam/CN=localhost.com" -newkey rsa:2048 -keyout \
	/etc/ssl/private/ftps-selfsigned.key -out /etc/ssl/certs/ftps-selfsigned.crt;

# place files inside container
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY getip.sh ./getip.sh			
RUN chmod +x getip.sh

# open ports
EXPOSE 20 21 10003 10004 10005

# run script to get the right IP address
CMD ./getip.sh
