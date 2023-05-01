#!/bin/sh

# docker build -t so .
docker run --rm  --volume "`pwd`:/data" so:latest
