FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      scons \
      pkg-config \
      libx11-dev \
      libxcursor-dev \
      libxinerama-dev \
      libgl1-mesa-dev \
      libglu-dev \
      libasound2-dev \
      libpulse-dev \
      libudev-dev \
      libxi-dev \
      libxrandr-dev \
      yasm

COPY . /opt/

WORKDIR /opt

EXPOSE 3000/tcp
EXPOSE 3000/udp

CMD ./pond-server --main-pack pond-server.pck
