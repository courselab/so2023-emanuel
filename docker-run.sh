#!/bin/sh

# docker build -t so .
docker run -it --rm  --volume "`pwd`:/data" so:latest


