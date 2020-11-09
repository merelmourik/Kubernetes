# MySQL Database Service is a fully managed database service to deploy 
# cloud-native applications using the world’s most popular open source database. 
# SQL is the language used to create, modify and extract data from the relational 
# database, as well as control user access to the database.

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

# giving the start script the correct execute permission
RUN chmod +x /start.sh

# exposing the correct port
EXPOSE 3306

# executing so it keeps running
CMD ./start.sh
