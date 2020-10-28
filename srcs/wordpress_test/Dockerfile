# We need to build from Alpine Linux.
FROM alpine:latest

# Update the apk package manager and install all necessary packages
RUN apk update && \
	apk add nginx sudo mysql-client jq curl && \
	apk add php7 php7-fpm php7-opcache php7-common php7-curl php7-json \
			php7-mbstring php7-xml php7-zip php7-gd php7-soap php7-tokenizer \
			php7-dom php7-exif php7-fileinfo php7-mysqli php7-zlib php7-phar

# Create a folder for nginx.pid, add user www for nginx and wordpress.
RUN mkdir /var/run/nginx && \
	mkdir -p /www && \
	adduser -D -g 'www' www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# Download Wordpress Command Line Interface
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Copy the nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the startup script.
COPY startup.sh /startup.sh

# Give execute rights to the startup script.
RUN chmod +x /startup.sh

# Install WordPress.
WORKDIR www/
RUN wp core download

# Reset the working directory.
WORKDIR /

# Expose port 5050.
EXPOSE 5050

# Keep the container running.
CMD ./startup.sh
