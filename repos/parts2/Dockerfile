FROM debian:bookworm-slim

WORKDIR /work

ENV DEBIAN_FRONTEND=noninteractive

ENV PARTS_COMMANDS=none

ARG TARGETPLATFORM

ARG BUILDPLATFORM

RUN apt update && apt upgrade -y

RUN apt install -y mc less netcat-openbsd emacs-nox openscad dialog python3 python3-pip python3-venv dialog build-essential

RUN echo "$TARGETPLATFORM" >/platform

RUN cd / && python3 -m venv venv

RUN . /venv/bin/activate && pip install rich requests pandas openpyxl pythondialog reportlab

#RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then echo arm | tee -a ../ap; fi

#RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then echo x86 | tee -a ../ap; fi

COPY src/parts2 /venv/lib/python3.11/site-packages/parts2

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]
