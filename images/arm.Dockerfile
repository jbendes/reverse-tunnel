FROM nvcr.io/nvidia/l4t-base:r32.4.3 as rover-base-bot

RUN apt-get update
RUN apt-get install -yq --no-install-recommends apt-utils
RUN apt-get install -yq --no-install-recommends make ca-certificates

ADD https://golang.org/dl/go1.15.7.linux-arm64.tar.gz /

RUN tar -C /usr/local -xzf go1.15.7.linux-arm64.tar.gz

COPY ./ /reverse-tunnel

RUN cd reverse-tunnel && \
    export PATH=$PATH:/usr/local/go/bin && \
    echo $PATH && \
    make
