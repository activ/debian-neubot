FROM debian:jessie
MAINTAINER none

VOLUME ["/config"]

RUN ln -s /var/lib/neubot /config
RUN apt-get update && apt-get -y install wget python cron && apt-get clean && rm -rf /var/lib/apt/lists/* 
RUN wget http://releases.neubot.org/neubot-nox-0.4.16.9-1_all.deb -P /pkg/
RUN dpkg -i /pkg/*.deb
RUN rm -f /pkg/*.deb
RUN echo "address 0.0.0.0" >> /etc/neubot/api  

EXPOSE 9774

CMD neubot agent -D agent.daemonize=no 


