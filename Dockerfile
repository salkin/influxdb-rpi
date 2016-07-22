FROM resin/rpi-raspbian
MAINTAINER niklas.wik@iki.fi

env INFLUXDB_VERSION=0.12.2

RUN wget -q https://s3.amazonaws.com/influxdb/influxdb_$INFLUXDB_VERSION-1_armhf.deb && \
dpkg -i influxdb_$INFLUXDB_VERSION-1_armhf.deb && \
 rm -f influxdb_$INFLUXDB_VERSION-1_armhf.deb*
