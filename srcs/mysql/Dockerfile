# building from Alpine Linux
FROM alpine:3.12

# update and upgrade the apk package manager and install mysql
RUN	apk update && \
	apk upgrade && \
	apk add mysql \
	mysql-client 

# copying the mysql config and the startup script
COPY ./start.sh /start.sh
COPY ./my.cnf /etc/
COPY ./create.sql /create.sql

# Give the script execute permissions.
RUN chmod +x /start.sh

# exposing the correct port (3306)
EXPOSE 3306

# executing so it keeps running
CMD ./start.sh