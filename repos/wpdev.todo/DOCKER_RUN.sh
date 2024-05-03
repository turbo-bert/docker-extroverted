#!/bin/bash


docker run -d --rm -v $PWD/src/www:/var/www/html -it --name wpdev -p 8080:80 `cat DTAG`
