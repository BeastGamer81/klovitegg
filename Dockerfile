FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \ 
    && apt-get -y upgrade \
    && apt -y --no-install-recommends install curl wget unzip git tar bash lsof software-properties-common ca-certificates openssl figlet \
    && useradd -ms /bin/bash container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
COPY ./install.sh /install.sh

CMD ["/bin/bash", "/entrypoint.sh"]
