# percona-platform-docker DEMO Setup

This will setup:

- 2 `percona server` servers, with `percona-agent`
- 2 sysbench containers each running a benchmark on a `percona server` container
- 1 percona platform

At this moment, only percona-agent is configured, no Prometheus exporters work as of yet.

## Prerequisites

Ensure you have `docker` and `docker-compose` installed. This came automagically when installing `Docker Toolbox` for OSX, available here: https://www.docker.com/docker-toolbox.


## Build Environment

```
docker-compose build
```

## Bring Environment UP

```
docker-compose up
```

## Go to web interface

Percona QAN will be listening on `http://192.168.99.100:8000`, where `192.168.99.100` is the IP address of the machine running docker containers


## Remove environment

Just run:

```
docker-compose rm
```

## NOTES

- This tool does not yet support stop and start, `percona-platform` actually fails on this

