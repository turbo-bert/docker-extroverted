FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y

RUN apt install -y git python3-full python3-pip

RUN python3 -m venv /py

RUN /bin/bash -c '. /py/bin/activate && pip install qrcode'

RUN cd / && git clone https://github.com/turbo-bert/qrl.git

WORKDIR /work

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]
