FROM bids/base_validator

# Mostly adapted from the official spm-docker recipe

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

ARG DEBIAN_FRONTEND="noninteractive"

## basic OS tools install
RUN apt-get update -qq && \
    apt-get -y -qq install \
        build-essential \
        software-properties-common\
        curl \
        octave \
        liboctave-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Install SPM
ENV SPM_VERSION 12
ENV SPM_REVISION r7771
RUN mkdir /opt/spm${SPM_VERSION} && \
    curl -SL https://github.com/spm/spm${SPM_VERSION}/archive/${SPM_REVISION}.tar.gz | \
    tar -xzC /opt/spm${SPM_VERSION} --strip-components 1 && \
    curl -SL https://raw.githubusercontent.com/spm/spm-docker/main/octave/spm${SPM_VERSION}_${SPM_REVISION}.patch | \
    patch -p0 && \
    make -C /opt/spm${SPM_VERSION}/src PLATFORM=octave distclean && \
    make -C /opt/spm${SPM_VERSION}/src PLATFORM=octave && \
    make -C /opt/spm${SPM_VERSION}/src PLATFORM=octave install && \
    ln -s /opt/spm${SPM_VERSION}/bin/spm${SPM_VERSION}-octave /usr/local/bin/spm${SPM_VERSION} & \
    octave --no-gui --eval "addpath('/opt/spm12/'); savepath ();"

