FROM openwrtorg/packages-cci:latest

USER root

RUN apt-get -qy update && \
    apt-get -qy install sudo nano vim ncdu && \
    rm -rf /var/lib/apt/lists/* && \
    echo "build ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/build && \
    chmod 400 /etc/sudoers.d/build

USER build
WORKDIR /home/build
RUN git clone https://github.com/Entware/Entware.git entware

WORKDIR /home/build/entware
RUN echo "wait..." && \
    cp configs/mipsel-3.4.config .config && \
    make -j3 tools/install && \
    make -j3 toolchain/install && \
    make -j3 target/compile && \
    rm -rf build_dir && \
    echo dont rm -rf staging_dir/toolchain-mipsel_*/initial && \
    make package/symlinks && \
    mkdir -p ../output && \
    echo "done"

RUN make package/usbreset/compile || echo failed...
