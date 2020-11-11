FROM alpine:latest

RUN apk update && \
	apk add vim \
			nginx \
			mysql-client \
			wget \
			php7 \
			php7-json \
			php7-fpm \
			php7-session \
			php7-mysqli \
			php7-mbstring \
			php7-phar \
			jq \
			curl

# Nginx
RUN mkdir /var/run/nginx
RUN adduser -D -g 'www' www
RUN mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# download and install Wordpress
RUN wget https://wordpress.org/latest.tar.gz -P ./
RUN tar xzf /latest.tar.gz --strip-components=1 -C /www/

# copy necessary files to container
COPY nginx.conf /etc/nginx/nginx.conf
#COPY index.html /www/index.html
COPY wp-config.php /www/
COPY startup.sh ./

# make files executable
RUN chmod 755 /www/wp-config.php
RUN chmod +x startup.sh


# configure wordpress
#RUN adduser --disabled-password -gecos "" rixt && \
#	sudo adduser rixt sudo

# download wordpress command line interface
RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#RUN chown rde-vrie -R /www
#RUN sudo -u rixt -i -- wp core install --url=mysql --title="wordpress" --admin_name=rixt --admin_password=secret --admin_email=rixt@example.com --path=/www/

# Open port
EXPOSE 5050

#delete this in the end:
#CMD tail -f /dev/null
CMD ./startup.sh
