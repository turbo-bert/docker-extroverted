FROM debian:bookworm-slim

RUN apt update && apt upgrade -y

RUN apt install -y mc less netcat-openbsd emacs-nox

WORKDIR /work

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]

