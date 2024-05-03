FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y build-essential git make texlive-latex-base texlive-latex-extra

RUN apt install -y graphicsmagick-imagemagick-compat

WORKDIR /work

CMD [ "/bin/bash", "/startup.sh" ]

COPY src/lit.tex /lit.tex

COPY src/startup.sh /startup.sh
