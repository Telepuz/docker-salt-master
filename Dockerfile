FROM ubuntu:bionic
MAINTAINER Lex White <t7k312@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

# Install SaltStack
RUN apt update \
    && apt-get install -y gnupg \
        wget \
    && wget -O - \
        https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub |\
        apt-key add - \
    && echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" >> \
    /etc/apt/sources.list.d/salt.list \
    && apt-get update \
    && apt-get install -y \
        salt-master \
        salt-minion \
        salt-api \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Ports\user\volume
EXPOSE 4505 4506 8000

# Exec
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
