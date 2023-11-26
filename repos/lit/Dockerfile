FROM python:3

RUN apt update && apt upgrade -y

WORKDIR /app

RUN apt install -y mc less netcat-openbsd emacs-nox python3 python3-pip

RUN pip3 install rich requests

#COPY src/$DOCKER_APP_NAME/. /app/$DOCKER_APP_NAME
COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]

