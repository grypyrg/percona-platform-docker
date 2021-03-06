# percona-platform-docker DEMO Setup

## Purpose

The purpose of this is to automatically setup the percona platform tools and run some test workloads in order to be able to quickly evaluate and demonstrate them.

It can also be very useful for automatic testing of new releases of our docker images and software.

## Contents

This will setup:

- 2 `percona server` servers, with `percona-agent`
- 6 containers `mysqld_exporter` for prometheus monitoring of the mysql servers
- 2 sysbench containers each running a benchmark on a `percona server` container
- 1 prometheus node monitor (for OS Metrics)
- 1 percona platform (based on Daniel's docker container)


## Prerequisites

Ensure you have `docker` and `docker-compose` installed. This came automagically when installing `Docker Toolbox` for OSX, available here: https://www.docker.com/docker-toolbox.


## Build Environment

```
docker-compose build
```

## Bring Environment UP

```
docker-compose up -d
```


## Go to web interfaces

It takes a while before the whole environment is up and running, but just try to go to the different interfaces:

- Percona QAN will be listening on `http://192.168.99.100:8000`, where `192.168.99.100` is the IP address of the machine running docker containers
- Grafana is accessible on `http://192.168.99.100:3000/`, username:password is `admin:admin`. Note that some dashboards use the `mysqld-` hosts (MySQL Metrics), others the `node-` dashboards (OS Level Metrics).
- Consul UI is available at `http://192.168.99.100:8500/ui` (used for service discovery).


## Remove environment

Just run:

```
docker-compose stop
docker-compose rm
```

## NOTES

- This tool does not yet support stop and start, `percona-platform` actually fails on this

