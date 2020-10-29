envsubst '${DB_USER} ${DB_PASSWORD}' < /etc/my.cnf > /etc/my.cnf

mysql_install_db --user=$DB_USER --ldata=/var/lib/mysql

# allow local dbg

:> /etc/sql
cat /etc/create >> /etc/sql
echo "" >> /etc/sql
# allow external connections
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" >> /etc/sql
echo "SET PASSWORD FOR '$DB_USER'@'localhost'=PASSWORD('${DB_PASSWORD}') ;" >> /etc/sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" >> /etc/sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" >> /etc/sql
echo "GRANT ALL ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" >> /etc/sql
echo "FLUSH PRIVILEGES;" >> /etc/sql

/usr/bin/mysqld --console --init_file=/etc/sql