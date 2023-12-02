FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y texlive-base build-essential git make

RUN apt install -y graphicsmagick-imagemagick-compat

WORKDIR /work

CMD [ "/bin/bash", "/startup.sh" ]

COPY src/lit.tex /lit.tex

COPY src/startup.sh /startup.sh
