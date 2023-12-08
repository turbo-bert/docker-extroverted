FROM debian:bookworm-slim

ARG TARGETPLATFORM

ARG BUILDPLATFORM

RUN echo "$TARGETPLATFORM" >/platform

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y texlive-base build-essential git make curl

RUN apt install -y graphicsmagick-imagemagick-compat

WORKDIR /work

CMD [ "/bin/bash", "/startup.sh" ]

RUN apt install -y libgtk-3-0 libnotify4 libnss3 libxss1 libatspi2.0-0 libsecret-1-0 libasound2

RUN apt install -y xvfb

RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then curl -L -o /installer.deb https://github.com/jgraph/drawio-desktop/releases/download/v22.1.2/drawio-arm64-22.1.2.deb ; fi

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then curl -L -o /installer.deb https://github.com/jgraph/drawio-desktop/releases/download/v22.1.2/drawio-amd64-22.1.2.deb ; fi

RUN dpkg -i /installer.deb

RUN apt install -y xorg dbus

RUN mkdir -p /var/run/dbus

RUN mkdir -p /run/dbus

RUN dbus-uuidgen >/var/lib/dbus/machine-id

RUN apt install -y xdg-desktop-portal xdg-utils xdg-desktop-portal-gtk fluxbox xdg-dbus-proxy

COPY src/startup.sh /startup.sh
