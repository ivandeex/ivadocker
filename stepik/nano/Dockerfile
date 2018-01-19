FROM ubuntu:16.04
ARG UID=1000
RUN apt-get update -qq \
 && apt-get install -y \
    nano \
 && rm -rf /var/cache/apt/archives/*.deb \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd -r -g $UID stepik \
 && useradd -u $UID -g $UID -r -m stepik \
 && echo ok
WORKDIR /home/stepik
VOLUME /home/stepik
USER stepik:stepik
ENV EDITOR=nano
ENTRYPOINT ["nano", "-t"]
CMD ["test"]
