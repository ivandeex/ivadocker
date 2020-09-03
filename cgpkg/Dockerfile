FROM ubuntu:18.04

# install base packages (keep apt lists for future updates)
RUN set -eux \
 && dpkg --add-architecture i386 \
 && apt-get -qqy update \
 && apt-get -qqy install \
      --no-install-recommends \
      build-essential \
      libc6-i386 \
      dkms \
      fuse \
      linux-headers-$(uname -r) \
      curl \
 && apt-get clean \
 && : rm -rf /var/lib/apt/lists \
 && rm -rf /usr/share/doc /usr/share/man \
 && :

# install darling
ENV VER=0.1
ARG version=0.1.20200331
RUN set -eux \
 && curl -sSfLk -o darling.deb \
    https://github.com/darlinghq/darling/releases/download/v${version}/darling_${version}.testing_amd64.deb \
 && curl -sSfLk -o darling-dkms.deb \
    https://github.com/darlinghq/darling/releases/download/v${version}/darling-dkms_${version}.testing_amd64.deb \
 && dpkg -i darling*.deb \
 && rm -f darling*.deb \
 && :

# install cgpkg binary
ENV SERIAL=48495051
ENV DYLD_ROOT_PATH=/usr/libexec/darling
COPY ./macos/cgpkg-6.1 $DYLD_ROOT_PATH/bin/cgpkg
COPY ./entrypoint.sh /entrypoint

ENTRYPOINT ["/entrypoint"]
