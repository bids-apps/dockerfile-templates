FROM bids/base_validator

RUN apt-get update && \
    apt-get install -y curl && \
		mkdir -p /opt/ants && \
    curl -sSL "https://github.com/stnava/ANTs/releases/download/v2.1.0/Linux_Ubuntu14.04.tar.bz2" \
    | tar -xjC /opt/ants --strip-components 1 && \
		apt-get remove -y curl && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ANTSPATH /opt/ants
ENV PATH $ANTSPATH:$PATH
