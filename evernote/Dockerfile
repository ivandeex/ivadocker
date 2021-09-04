FROM jess/wine

RUN apt-get update \
 && apt-get install -y \
            ca-certificates \
            x11-xserver-utils x11-apps iputils-ping iproute2


ADD https://evernote.com/download/get.php?file=Win /usr/src/evernote.exe

RUN echo "wine .wine/drive_c/Program\ Files/Evernote/Evernote/Evernote.exe" >> /root/.bash_history \
 && echo "wine wineboot --init && wine /usr/src/evernote.exe" >> /root/.bash_history

CMD [ "bash" ]
