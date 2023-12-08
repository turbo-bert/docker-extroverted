FROM debian:bookworm-slim

#RUN apt update && apt upgrade -y

#RUN apt install -y mc less netcat-openbsd emacs-nox

WORKDIR /work

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]

ARG TARGETPLATFORM

ARG BUILDPLATFORM

RUN echo "$TARGETPLATFORM" >/platform

RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then echo arm | tee -a ../ap; fi

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then echo x86 | tee -a ../ap; fi
