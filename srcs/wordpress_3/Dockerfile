# building from Alpine Linux
FROM alpine:3.12

# update the packagelist and install necessary packages
RUN apk update && \
	apk add nginx sudo mysql-client jq curl && \
   	apk add php7 php7-fpm php7-opcache php7-common php7-curl php7-json \
			php7-mbstring php7-xml php7-zip php7-gd php7-soap php7-tokenizer \
			php7-dom php7-exif php7-fileinfo php7-mysqli php7-zlib php7-phar

# creating a folder for nginx.pid, a folder for the user
RUN mkdir /var/run/nginx && \
	mkdir -p /www

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

# # set the workdir back
WORKDIR /

# copying the configurations and the start script
COPY nginx.conf /etc/nginx/nginx.conf
# COPY wp-config.php /www/wp-config.php
COPY start.sh /start.sh

# give yourself the execute rights for the start script
RUN chmod +x /start.sh

# expose the correct port
EXPOSE 5050

# make sure that the container keeps running
CMD ./start.sh
