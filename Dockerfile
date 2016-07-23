FROM resin/rpi-raspbian
MAINTAINER niklas.wik@iki.fi

env INFLUXDB_VERSION=0.12.2

RUN apt-get update && apt-get install wget -y

RUN wget -q https://s3.amazonaws.com/influxdb/influxdb_$INFLUXDB_VERSION-1_armhf.deb && \
dpkg -i influxdb_$INFLUXDB_VERSION-1_armhf.deb && \
 rm -f influxdb_$INFLUXDB_VERSION-1_armhf.deb*

EXPOSE 8083 8086

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]

