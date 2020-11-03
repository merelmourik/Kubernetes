# building from Alpine Linux
FROM alpine:latest

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
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=ft_services' -keyout /etc/ssl/ftps.key -out /etc/ssl/ftps.crt

# copying the vsftpd configuration file and the start script to the corerct directory
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /start.sh

# exposing ports 20 & 21
EXPOSE 20 21 10001 10002 10003

# giving the script execute permission.
RUN chmod +x /start.sh

# Run the script when the container launches.
CMD ./start.sh
