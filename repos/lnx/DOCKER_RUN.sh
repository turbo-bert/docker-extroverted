#!/bin/bash


docker run -p 8080:80 --rm -v $PWD/work/html:/var/www/html -v $PWD/work/etc--nginx:/etc/nginx -it `cat DTAG`
