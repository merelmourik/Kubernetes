# building from Alpine Linux
FROM alpine:3.12

# update and upgrade the apk package manager and install mysql
RUN	apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add --no-cache mysql \
	mysql-client \
	gettext
# gettext searches for a 'string $message' and translates it,
# in this file it is used to translate the 'envsubst' variables

# copying the mysql config and the startup script
COPY ./start.sh /tmp/start.sh
COPY ./my.cnf /tmp/
COPY ./create.sql /tmp/

# replacing the environment variables with the ones in my.cnf
RUN envsubst ${DB_USER} ${DB_PASSWORD} < /tmp/my.cnf > /etc/my.cnf

# Give the script execute permissions.
RUN chmod +x /tmp/start.sh

# a volume is a directory(with some data in it) on a disk or on a different container 
# which is accessible to the containers in a pod
VOLUME /var/lib/mysql

# executing so it keeps running
CMD ./bin/sh
CMD ./tmp/start.sh