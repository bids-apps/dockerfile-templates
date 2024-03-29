FROM bids/base_validator

# LABEL Guillaume Flandin <g.flandin@ucl.ac.uk>

ARG DEBIAN_FRONTEND="noninteractive"

# Update system
RUN apt-get update -qq  && apt-get install --no-install-recommends -q -y \
    unzip \
    xorg \
    wget && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install MATLAB MCR
ENV MATLAB_VERSION R2019b
ENV MATLAB_UPDATE 5
RUN mkdir /opt/mcr_install && \
    mkdir /opt/mcr && \
    wget --progress=dot:giga -P /opt/mcr_install https://ssd.mathworks.com/supportfiles/downloads/${MATLAB_VERSION}/Release/${MATLAB_UPDATE}/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_${MATLAB_VERSION}_Update_${MATLAB_UPDATE}_glnxa64.zip && \
    unzip -q /opt/mcr_install/MATLAB_Runtime_${MATLAB_VERSION}_Update_${MATLAB_UPDATE}_glnxa64.zip -d /opt/mcr_install && \
    /opt/mcr_install/install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    rm -rf /opt/mcr_install /tmp/*

# Configure environment
ENV MCR_VERSION v97
ENV LD_LIBRARY_PATH /opt/mcr/${MCR_VERSION}/runtime/glnxa64:/opt/mcr/${MCR_VERSION}/bin/glnxa64:/opt/mcr/${MCR_VERSION}/sys/os/glnxa64:/opt/mcr/${MCR_VERSION}/sys/opengl/lib/glnxa64
ENV MCR_INHIBIT_CTF_LOCK 1

# Install SPM Standalone
ENV SPM_VERSION 12
ENV SPM_REVISION r7771
ENV SPM_DIR /opt/spm${SPM_VERSION}
ENV SPM_EXEC ${SPM_DIR}/spm${SPM_VERSION}
RUN wget --progress=dot:giga -P /opt https://www.fil.ion.ucl.ac.uk/spm/download/restricted/bids/spm${SPM_VERSION}_${SPM_REVISION}_Linux_${MATLAB_VERSION}.zip && \
    unzip -q /opt/spm${SPM_VERSION}_${SPM_REVISION}_Linux_${MATLAB_VERSION}.zip -d /opt && \
    rm -f /opt/spm${SPM_VERSION}_${SPM_REVISION}_Linux_${MATLAB_VERSION}.zip && \
    ${SPM_EXEC} function exit

ENV SPMMCRCMD "/opt/spm12/run_spm12.sh /opt/mcr/v85/ script"
ENV FORCE_SPMMCR 1
