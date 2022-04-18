FROM ubuntu:latest
ENV PYTHONUNBUFFERED 1
ADD . /tmp
# RUN sh /tmp/build.sh
RUN mkdir /src
WORKDIR /src
