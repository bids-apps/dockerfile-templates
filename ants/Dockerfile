FROM bids/base_validator

RUN apt-get update && \
    apt-get install -y curl && \
		mkdir -p /opt/ants && \
    curl -sSL "https://github.com/ANTsX/ANTs/releases/download/v2.4.2/ants-2.4.2-ubuntu-22.04-X64-gcc.zip" \
    | tar -xjC /opt/ants --strip-components 1 && \
		apt-get remove -y curl && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ANTSPATH /opt/ants
ENV PATH $ANTSPATH:$PATH
