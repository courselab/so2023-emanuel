FROM debian:bullseye-slim

ENV TZ=US/Arizona \
  DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386
RUN apt update; apt install binutils make build-essential gcc-multilib  -y

ENTRYPOINT ["/bin/sh", "-c" , "cd /data && /bin/bash"]
