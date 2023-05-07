FROM debian:bullseye-slim

ENV TZ=US/Arizona \
  DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386
#RUN apt update; apt install binutils make build-essential libc6-dev:i386 gcc:i386 -y
RUN apt update; apt install binutils make build-essential -y
#COPY entrypoint.sh .

#ENTRYPOINT [ "/bin/bash" ]
ENTRYPOINT ["/bin/sh", "-c" , "cd /data && /bin/bash"]
