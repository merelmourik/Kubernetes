# # building from Alpine Linux
# FROM alpine:3.12

# # update and upgrade the apk package manager and install mysql
# RUN	apk update --no-cache && \
# 	apk upgrade --no-cache && \
# 	apk add --no-cache mysql \
# 	mysql-client \
# 	gettext		
# 	# wat doet de laatste?

# # Copy the MySQL config and the startup script.
# COPY my.cnf /etc/my.cnf
# COPY start.sh /start.sh
# COPY create.sql /create.sql

# RUN envsubst ${DB_USER} ${DB_PASSWORD} < /etc/my.cnf > /etc/my.cnf
# # Give the script execute permissions.
# RUN chmod +x /start.sh

# # Expose the default MySQL port.
# EXPOSE 3306
# # is dit nodig?

# Run command to keep container running.
CMD ./start.sh

FROM alpine:3.12

RUN	apk update --no-cache && \
	apk upgrade --no-cache && \
	apk add --no-cache mysql \
	mysql-client \
	gettext

COPY ./srcs/startup.sh /tmp/startup.sh
COPY ./srcs/my.cnf /tmp/
COPY ./srcs/create_tables.sql /tmp/

RUN envsubst ${DB_USER} ${DB_PASSWORD} < /tmp/my.cnf > /etc/my.cnf

RUN chmod +x /tmp/startup.sh

# a volume is a directory(with some data in it) on a disk or on a different container 
# which is accessible to the containers in a pod
VOLUME /var/lib/mysql

ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]