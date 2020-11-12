FROM alpine:latest

RUN apk update && \
	apk add vsftpd && \
	apk add vim && \
	apk add openssl && \
	apk add jq && \
	apk add curl

# Make user with home dir and password
RUN mkdir -p ftps/mmourik
RUN adduser -h /ftps/mmourik -D mmourik
RUN echo "mmourik:strawberry" | chpasswd

RUN openssl req -x509 -nodes -days 365 -subj \
	"/C=NL/ST=Noord-Holland/O=Codam/CN=localhost.com" -newkey rsa:2048 -keyout \
	/etc/ssl/private/ftps-selfsigned.key -out /etc/ssl/certs/ftps-selfsigned.crt;

# Place files inside container
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY getip.sh ./
RUN chmod +x getip.sh

# Open ports
EXPOSE 20 21 10003 10004 10005

# Run script to get the right IP address
CMD ./getip.sh
