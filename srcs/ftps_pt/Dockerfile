FROM alpine

RUN apk update && \
	apk upgrade && \
	apk add openrc openssl --no-cache && \
	apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
# ssl

# creating a folder for the new user for FTP
RUN mkdir -p /ftps/mmourik

# creating a new user in the correct map
RUN adduser -h /ftps/mmourik -D mmourik && \
	echo "mmourik:strawberry" | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -subj '/C=NL/ST=Amsterdam/O=Codam/CN=Kubernetes' \
	-keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem 

# RUN adduser -D "admin" && \
# 	echo "admin:admin" | chpasswd

EXPOSE 21 21000 21001 21002 21003 21004 21005 21006 21007 21008 21009

ENTRYPOINT pure-ftpd -p 21000:21009 -P 192.168.99.253
