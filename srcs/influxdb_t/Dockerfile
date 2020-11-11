FROM alpine:latest
 
RUN apk update && \
	apk add vim \
			influxdb \
			wget \
			curl

# expose default port 8086
EXPOSE 8086

#CMD ./startup.sh
CMD influxd run
