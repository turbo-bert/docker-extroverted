FROM debian:bookworm-slim

WORKDIR /work

ENV DEBIAN_FRONTEND=noninteractive

ENV PARTS_COMMANDS=none

ARG TARGETPLATFORM

ARG BUILDPLATFORM

RUN apt update && apt upgrade -y

RUN apt install -y mc less plantuml
#RUN apt install -y mc less netcat-openbsd emacs-nox plantuml

RUN echo "$TARGETPLATFORM" >/platform

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]
