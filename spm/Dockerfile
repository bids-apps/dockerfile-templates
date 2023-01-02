FROM bids/base_validator

RUN apt-get update && \
    apt-get install -y curl zip && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "destinationFolder=/opt/mcr" > /opt/mcr_options.txt && \
    echo "agreeToLicense=yes" >> /opt/mcr_options.txt && \
    echo "outputFile=/tmp/matlabinstall_log" >> /opt/mcr_options.txt && \
    echo "mode=silent" >> /opt/mcr_options.txt && \
    mkdir -p /opt/matlab_installer && \
    curl -SL http://www.mathworks.com/supportfiles/downloads/R2016a/deployment_files/R2016a/installers/glnxa64/MCR_R2016a_glnxa64_installer.zip \
         -o /opt/matlab_installer/installer.zip && \
    unzip /opt/matlab_installer/installer.zip -d /opt/matlab_installer/ && \
    /opt/matlab_installer/install -inputFile /opt/mcr_options.txt && \
    rm -rf /opt/matlab_installer /opt/mcr_options.txt

# Install SPM
RUN curl -sSL http://www.fil.ion.ucl.ac.uk/spm/download/restricted/utopia/dev/spm12_r6846_Linux_R2016a.zip -o /opt/spm12.zip && \
    unzip /opt/spm12.zip -d /opt && \
    rm -rf /opt/spm12.zip

ENV SPMMCRCMD "/opt/spm12/run_spm12.sh /opt/mcr/v85/ script"
ENV FORCE_SPMMCR 1
