# Telegraf is a plugin-driven server agent for collecting and sending metrics
# and events from databases, systems, and IoT sensors.

# building from Alpine Linux
FROM alpine:3.12

# downloading and installing telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz && \
	tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz && \
	chmod +x telegraf/telegraf && \
	cp telegraf/telegraf /usr/bin/

# putting the configuration file in the correct directory
COPY telegraf.conf /etc/telegraf/telegraf.conf

# exposing port 8125
EXPOSE 8125

# make sure that the container keeps running
CMD telegraf
