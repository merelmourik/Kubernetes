# building from Alpine Linux
From alpine:3.12

# update the packagelist and install necessary packages
Run apk update && \
    apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
            php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
            php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
## installing too much ?

# install mysql
apk add wget php5-mysql mysql mysql-client php5-zlib
## installing too much right now


# create a directory named 'webapps'
mkdir -p /usr/share/webapps/

# download the latest Wordpress source files
cd /usr/share/webapps/ wget http://wordpress.org/latest.tar.gz

# unpack the archive and delete it afterwards
tar -xzvf latest.tar.gz
rm latest.tar.gz

# create a symbolic link to the wordpress folder
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

# configurations and starting 