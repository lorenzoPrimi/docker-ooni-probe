# syntax=docker/dockerfile:1

FROM debian:11.6-slim

LABEL org.opencontainers.image.source=https://github.com/lorenzoPrimi/docker-ooni-probe
LABEL org.opencontainers.image.authors=LorenzoPrimiterra

RUN apt-get update && apt-get install -y gnupg

RUN apt-key adv --verbose --keyserver hkp://keyserver.ubuntu.com --recv-keys 'B5A08F01796E7F521861B449372D1FF271F2DD50'

RUN echo "deb http://deb.ooni.org/ unstable main" | tee /etc/apt/sources.list.d/ooniprobe.list

RUN apt-get update && apt-get install -y ooniprobe-cli

RUN apt-get install -y unattended-upgrades apt-listchanges

RUN sed -i '/Unattended-Upgrade::Origins-Pattern {/a "origin=ooni";' /etc/apt/apt.conf.d/50unattended-upgrades

ARG USER=ooniprobe

USER $USER

RUN /usr/bin/ooniprobe onboard --yes

CMD ["/usr/bin/ooniprobe", "run", "unattended", "--batch"]
