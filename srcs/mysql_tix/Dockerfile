FROM alpine:latest
 
RUN apk update && \
	apk add vim \
	mysql \
	mysql-client

COPY init.sql /init.sql
COPY my.cnf /etc/my.cnf
COPY startup.sh /startup.sh
RUN chmod +x startup.sh

# expose default port 3306
EXPOSE 3306

CMD ./startup.sh
#CMD tail -f /dev/null
