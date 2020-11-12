# InfluxDB is an open-source time series database (TSDB). It is optimized for fast, 
# high-availability storage and retrieval of time series data. It works with Grafana.

# building from Alpine Linux
FROM alpine:3.12

# update the apk package manager and install influxdb
RUN apk update && \
	apk add vim influxdb wget curl

# 8086 is the default port for influxdb, so expose that port
EXPOSE 8086

# give the command to start the container
CMD influxd run
