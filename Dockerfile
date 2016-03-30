FROM debian:8.3

RUN apt-get -qq update
RUN apt-get install -y gcc make
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get -qq -y update \
 && apt-get -qq -y install \
    gcc \
    make \
    libdwarf-dev \
    libiberty-dev \
 && apt-get -qq -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app
ADD . /app

RUN make && make install

CMD ["/bin/bash"]
