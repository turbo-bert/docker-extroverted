FROM debian:bookworm-slim

WORKDIR /work

RUN apt update && apt upgrade -y

RUN apt install -y texlive-full build-essential git make

RUN DEBIAN_FRONTEND=noninteractive apt install -y graphicsmagick-imagemagick-compat

CMD [ "/bin/bash", "/startup.sh" ]

COPY src/lit.tex /lit.tex

COPY src/startup.sh /startup.sh
