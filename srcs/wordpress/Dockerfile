# building from Alpine Linux
FROM alpine:3.12

# update the packagelist and install necessary packages
RUN apk update && \
	apk add nginx mysql-client wget php7 php7-json php7-fpm \
			php7-session php7-mysqli php7-mbstring php7-phar \
			jq curl

# creating a folder for nginx.pid and a folder for the user
RUN mkdir /var/run/nginx && \
	mkdir /www

# adding user www for nginx 
RUN adduser -D -g 'www' www

# changing the user ID for the hierarchies rooted in the files
RUN chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# download the wordpress command line interface, this also provides the terminal
# with recognizing the 'wp' in the start.sh file
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# first making sure you are in the correct directory and then 
# downloading the latest wordpress source files
WORKDIR	/www
RUN wp core download

# set the workdir back
WORKDIR /

# copying the configurations and the start script
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
COPY wp-config.php	/www/wp-config.php

# give yourself the execute rights for the start and wp-config script
RUN chmod +x /start.sh
RUN chmod +x /www/wp-config.php

# expose the correct port
EXPOSE 5050

# make sure that the container keeps running
CMD ./start.sh
