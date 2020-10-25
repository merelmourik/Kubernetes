# building from Alpine Linux
FROM alpine:3.12

# update the apk package manager and install php and nginx
RUN apk update && apk upgrade && \
	apk add php7 php7-fpm php7-mbstring php7-json php7-session php7-mysqli && \
	apk add nginx 

# downloading and unpacking PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	mkdir www && \
	tar -xzvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www
# create dir www here instead of by the download

# creating a folder for nginx.pid and a temporarily directory for confic.inc.php
RUN mkdir /var/run/nginx && mkdir /www/temp
# waarvoor wordt de 'run' directory gebruikt?

# adding user www for nginx
RUN adduser -D -g 'www' www

# changing the user ID for the hierarchies rooted in the files
RUN chown -R www:www /var/lib/nginx && \		
	chown -R www:www /www && \
	chown -R www:www /www/temp
# is dit niet al gedaan in nginx/docker? gaat om de eerste

# copying the nginx conf file and the php config files to the correct directories
# and copying the start.sh file
COPY nginx.conf /etc/nginx/nginx.conf
COPY confic.inc.php /www/confic.inc.php
COPY start.sh /start.sh

# give the start script permission to execute
RUN chmod +x /start.sh

# expose the 5000 port for PHP
EXPOSE 5000

# make sure that the container keeps running
CMD ./start.sh
