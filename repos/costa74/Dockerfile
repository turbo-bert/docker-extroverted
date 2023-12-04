FROM php:7.4-cli

RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y

RUN curl -L -o /usr/local/bin/composer 'https://github.com/composer/composer/releases/download/2.6.5/composer.phar' && chmod a+x /usr/local/bin/composer

RUN DEBIAN_FRONTEND=noninteractive apt install -y mc less netcat-openbsd emacs-nox build-essential git

#RUN DEBIAN_FRONTEND=noninteractive apt install -y composer

WORKDIR /work

COPY src/startup.sh /startup.sh

CMD [ "/bin/bash", "/startup.sh" ]

