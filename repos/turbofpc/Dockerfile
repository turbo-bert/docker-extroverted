FROM --platform=linux/amd64 debian:bookworm-slim

WORKDIR /work

ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETPLATFORM

ARG BUILDPLATFORM

RUN apt update && apt upgrade -y

RUN apt install -y mc less
# netcat-openbsd emacs-nox

RUN apt install -y build-essential

RUN echo "$TARGETPLATFORM" >/platform

#RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then echo arm | tee -a ../ap; fi

#RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then echo x86 | tee -a ../ap; fi

#RUN cd / && python3 -m venv venv

#RUN . /venv/bin/activate && pip install rich requests pandas openpyxl pythondialog reportlab

#COPY src/PYMOD /venv/lib/python3.11/site-packages/PYMOD

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]




COPY src/externals /externals

RUN dpkg -i /externals/fpc-src_3.2.2-210709_amd64.deb
RUN dpkg -i /externals/fpc-laz_3.2.2-210709_amd64.deb
RUN dpkg -i /externals/lazarus-project_3.2.0-0_amd64.deb; exit 0
RUN apt --fix-broken install -y
RUN apt install -y nano
