FROM ubuntu:18.04

ENV USER=root XAUTHORITY=/xauthority/.docker.xauth DISPLAY=":0"

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
tightvncserver \
expect \
xfonts-100dpi \
xfonts-75dpi \
xfonts-scalable \
xfonts-cyrillic \
tightvncserver \
fonts-ipafont-gothic && \
expect -c 'set timeout 3;spawn /usr/bin/vncpasswd;expect "*?assword:*";send -- "selenium\r";expect "*?erify:*";send -- "selenium\r";expect "*?view-only password*";send -- "n\r";send -- "\r";expect eof' && \
touch /root/.xsession && \
apt-get remove --purge -y expect && \
apt-get autoremove -y && \
apt-get clean && \
apt-get autoclean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
rm -rf /var/lib/apt/lists/*

CMD touch $XAUTHORITY && rm -rf /tmp/.X11-unix/* && /usr/bin/vncserver $DISPLAY -geometry 1920x1080 -depth 24  && xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTHORITY nmerge - && tail -F /root/.vnc/*.log

EXPOSE 5900
