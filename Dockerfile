FROM ubuntu:16.04
MAINTAINER clement vandoolaeghe

RUN apt-get update && apt-get install -y \
redis-tools \
netcat


# Add startup script
ADD startup.sh /startup.sh
RUN chmod a+x /startup.sh

# Docker startup
ENTRYPOINT ["/startup.sh"]
