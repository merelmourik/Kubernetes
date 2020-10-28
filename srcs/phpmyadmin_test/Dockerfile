# # We need to build from Alpine Linux.
# FROM alpine:3.12

# # Update the apk package manager and install all necessary packages.
# RUN apk update && \
# 	apk add php7 php7-fpm php7-mbstring php7-json php7-session php7-mysqli && \
# 	apk add nginx

# # Download and unpack PHPMyAdmin.
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
# 	mkdir www && \
# 	tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www

# RUN mkdir /var/run/nginx && \
# 	mkdir /www/temp

# # adding user www for nginx
# RUN adduser -D -g 'www' www

# # changing the user ID for the hierarchies rooted in the files
# RUN chown -R www:www /var/lib/nginx && \		
# 	chown -R www:www /www && \
# 	chown -R www:www /www/temp

# # copying the nginx conf file and the php config files to the correct directories
# # and copying the start.sh file
# COPY nginx.conf etc/nginx/nginx.conf
# COPY start.sh /start.sh
# # COPY config.inc.php /www/config.inc.php
# # deze lijken we niet nodig te hebbe, ook aanpassen in omschrijving

# # give the start script permission to execute
# RUN chmod +x /start.sh

# # expose the 5000 port for PHP
# EXPOSE 5000

# # make sure that the container keeps running
# CMD ./start.sh

# building from Alpine Linux
FROM alpine:3.12

# update the apk package manager and install php and nginx
RUN apk update && apk upgrade && \
	apk add php7 php7-fpm php7-mbstring php7-json php7-session php7-mysqli && \
	apk add nginx 

# creating a folder for nginx.pid, a temporarily folder for confic.inc.php
# and a folder for the user
RUN mkdir /var/run/nginx && \
	mkdir www && \
	mkdir /www/temp
# waarvoor wordt de 'run' directory gebruikt?

# downloading and unpacking PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www

# adding user www for nginx
RUN adduser -D -g 'www' www

# changing the user ID for the hierarchies rooted in the files
RUN chown -R www:www /var/lib/nginx && \		
	chown -R www:www /www && \
	chown -R www:www /www/temp

# copying the nginx conf file and the php config files to the correct directories
# and copying the start.sh file
COPY nginx.conf etc/nginx/nginx.conf
COPY start.sh /start.sh
#COPY confic.inc.php /www/confic.inc.php

# give the start script permission to execute
RUN chmod +x /start.sh

# expose the 5000 port for PHP
EXPOSE 5000

# make sure that the container keeps running
CMD ./start.sh
