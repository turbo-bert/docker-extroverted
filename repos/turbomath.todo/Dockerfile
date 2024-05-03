FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y texlive-latex-base texlive-latex-extra build-essential git make graphicsmagick-imagemagick-compat

WORKDIR /work

CMD [ "/bin/bash", "/startup.sh" ]

COPY src/lit.tex /lit.tex

COPY src/startup.sh /startup.sh
