FROM debian:bullseye-slim

ENV TZ=US/Arizona \
  DEBIAN_FRONTEND=noninteractive
RUN apt update; apt install binutils make qemu-user qemu-system-x86  -y
COPY entrypoint.sh .

ENTRYPOINT [ "./docker-entrypoint.sh" ]
