FROM ubuntu:focal

RUN DEBIAN_FRONTEND=noninteractive && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y apt-utils ca-certificates wget gnupg software-properties-common && \
    wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
    apt-key add winehq.key && \
    add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' && \
    apt-get update && \
    apt-get install -y --install-recommends winehq-stable && \
    apt-get install -y fonts-wine locales ttf-mscorefonts-installer \
      winbind libxv1 mesa-utils mesa-utils-extra libpulse0 && \
    apt-get dist-upgrade -y && \
    apt-get clean && \
    rm -rf /root/.wine /winehq.key

ENV DISPLAY :0
ENV WINEDLLOVERRIDES="mscoree,mshtml="
ENV WINEDEBUG=err
COPY scripts/rungame.sh /root/rungame.sh
CMD /root/rungame.sh
