FROM ubuntu:16.04
MAINTAINER Morton Jonuschat <m.jonuschat@mojocode.de>
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install \
    build-essential \
    git \
    makepasswd \
    rcs \
    perl-doc \
    libmail-imapclient-perl \
    libdigest-hmac-perl \
    libterm-readkey-perl \
    libio-socket-ssl-perl \
    libdate-manip-perl \
    libmail-imapclient-perl \
    libfile-copy-recursive-perl \
    libio-tee-perl \
    libunicode-string-perl \
    libany-uri-escape-perl \
    libauthen-ntlm-perl \
    libtest-pod-perl \
    libio-socket-inet6-perl \
    libdata-uniqid-perl

# Fetch imapsync source
RUN cd /usr/src && git clone git://github.com/imapsync/imapsync.git && \
    mkdir -p imapsync/dist && \
    cd imapsync && \
    make install

# Define Entrypoint
ENTRYPOINT ["imapsync"]
