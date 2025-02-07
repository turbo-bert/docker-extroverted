FROM ubuntu:24.04

WORKDIR /work

ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETPLATFORM

ARG BUILDPLATFORM

RUN apt update && apt upgrade -y

RUN apt install -y mc less netcat-openbsd emacs-nox

#RUN apt install -y dialog python3 python3-pip python3-venv build-essential

RUN echo "$TARGETPLATFORM" >/platform

#RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then echo arm | tee -a ../ap; fi

#RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then echo x86 | tee -a ../ap; fi

#RUN cd / && python3 -m venv venv

#RUN . /venv/bin/activate && pip install rich requests pandas openpyxl pythondialog reportlab

#COPY src/PYMOD /venv/lib/python3.11/site-packages/PYMOD

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]

RUN apt install -y libnginx-mod-http-lua rsync
