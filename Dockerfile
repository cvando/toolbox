FROM ubuntu:16.04
MAINTAINER clement vandoolaeghe

RUN apt update && apt-get install -y \
wget

RUN apt install -y software-properties-common && add-apt-repository 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt update && apt-get install -y \
nano \
git \
redis-tools \
netcat \
iputils-ping \
curl \
dnsutils \
tcpdump \
postgresql-client-10 \
mysql-client

# Add startup script
ADD startup.sh /startup.sh
RUN chmod a+x /startup.sh

# Docker startup
ENTRYPOINT ["/startup.sh"]
