# phpMyAdmin is a software tool written in PHP, intended to handle 
# the administration of MySQL over the Web.

# building from Alpine Linux
FROM alpine:3.12

# update the apk package manager and install php and nginx
RUN apk update && apk upgrade && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session php7-zip && \
	apk add nginx

# creating the necesarry folders
RUN mkdir -p /run/nginx && \
	mkdir -p /www/tmp && \
	mkdir -p /www/phpmyadmin/tmp

# downloading and unpacking PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www/phpmyadmin && \
	rm phpMyAdmin-5.0.1-english.tar.gz

# adding user www for nginx
RUN adduser -D -g 'www' www

# changing the user ID for the hierarchies rooted in the files
RUN chmod 777 /www/tmp && \
	chmod 777 /www/phpmyadmin/tmp && \
	chown -R www:www /var/lib/nginx && \		
	chown -R www:www /www/tmp && \
	chown -R www:www /www/phpmyadmin/tmp

# copying the configuration files and the start file to the correct directories
COPY nginx.conf etc/nginx/nginx.conf
COPY start.sh /start.sh
COPY config.inc.php /www/config.inc.php
COPY config.inc.php /www/phpmyadmin/config.inc.php

# give the start script permission to execute
RUN chmod +x /start.sh

# expose the 5000 port for PHP
EXPOSE 5000

# make sure that the container keeps running
CMD ./start.sh
