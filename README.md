# OONI Probe Docker image

This repository aims to create a debian cointainer with [OONI Probe](https://github.com/ooni/probe) made by the wonderful people at OONI (https://ooni.org/) 
The aim is to create an auot-updating container to be used in [Umbrel](https://github.com/getumbrel/umbrel) as a [Umbrel App](https://github.com/getumbrel/umbrel-apps)

The Open Observatory of Network Interference (OONI) is a non-profit free software project that aims to empower decentralized efforts in documenting Internet censorship around the world.

The source of the probe package is located on the ooni repository: https://github.com/ooni/probe-cli

## How to run as daemon
You can use any container orchestration tool, for small deployments you can use the provided docker-compose file:
```
docker-compose up -d
```

## Container specifics
This is the default startup command this container runs if none is specified:
```
/usr/bin/ooniprobe run unattended --batch
```
`--batch` outputs results in JSON format, easer to parse if you have any log collector

### OS
The image uses debian:11.6-slim as base image and install ooniprobe-cli via apt using the [Official Install Guide](https://ooni.org/install/cli/ubuntu-debian) 

### Security
The container is rootless by default

## TODO
- Enable [UnattendedUpgrades](https://wiki.debian.org/UnattendedUpgrades)
- Remove or cut logs
- Disable `onboard --yes` before releasing to Umbrel