FROM ubuntu:14.04
MAINTAINER Mario Uher <uher.mario@gmail.com>

WORKDIR /home

RUN apt-get update && apt-get install -y curl

ENV TEAMSPEAK_VERSION=3.0.11.4
RUN curl -LO http://dl.4players.de/ts/releases/$TEAMSPEAK_VERSION/teamspeak3-server_linux-amd64-$TEAMSPEAK_VERSION.tar.gz \
    && tar --strip-components=1 -xvf teamspeak3-server_linux-amd64-$TEAMSPEAK_VERSION.tar.gz \
    && rm teamspeak3-server_linux-amd64-$TEAMSPEAK_VERSION.tar.gz

ENV LD_LIBRARY_PATH=.
EXPOSE 9987/udp 10011 30033

ENTRYPOINT ["./ts3server_linux_amd64"]
CMD ["serveradmin_password=password"]
