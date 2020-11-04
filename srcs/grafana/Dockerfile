# grafana is a open source analytics & monitoring solution for every database, 
# in this case

# We need to build from Alpine Linux.
FROM alpine:latest

# Download libc6-compat for Grafana.
RUN apk update && \
	apk add libc6-compat

# Install Grafana.
RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz && \
	tar -zxvf grafana-7.2.0.linux-amd64.tar.gz

# Copy the datasource config.
COPY datasource.yaml /grafana-7.2.0/conf/provisioning/datasources/datasource.yaml

# Copy the dashboards.
COPY nginx_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/nginx_dashboard.json
COPY ftps_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/ftps_dashboard.json
COPY mysql_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/mysql_dashboard.json
COPY wordpress_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/wordpress_dashboard.json
COPY phpmyadmin_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/phpmyadmin_dashboard.json
COPY influxdb_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/influxdb_dashboard.json
COPY grafana_dashboard.json /grafana-7.2.0/conf/provisioning/dashboards/grafana_dashboard.json

# Copy the config file so Grafana recognizes the dashboard.
COPY default.yaml /grafana-7.2.0/conf/provisioning/dashboards/default.yaml

# Copy the grafana.db file, to allow us to log in as Mark.
COPY grafana.db /grafana-7.2.0/data/grafana.db

# Expose port 3000.
EXPOSE 3000

# Keep the container running.
CMD cd grafana-7.2.0 && ./bin/grafana-server
