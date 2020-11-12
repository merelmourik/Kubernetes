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
#CMD /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# Open ports
EXPOSE 20 21 21000 21001 21002 21003 21004 21005 21006 21007 21008 21009

# Run script to get the right IP address
CMD ./getip.sh
