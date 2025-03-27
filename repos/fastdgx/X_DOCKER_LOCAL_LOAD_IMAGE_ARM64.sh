#!/bin/bash


docker buildx build --load --platform linux/arm64 -t `cat DTAG` .
