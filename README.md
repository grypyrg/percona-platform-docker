# percona-platform-docker

This will setup:

- 2 `percona server` servers, with `percona-agent`
- 2 sysbench containers each running a benchmark on a `percona server` container
- 1 percona platform

At this moment, only percona-agent is configured, no prometheus exporters work at this mometn

## How To Run

## Prep Config
edit the `docker-compose.yml` and edit the 192.169.99.100 ip address and change it to your docker machine's IP address (this is the automatic IP address used by Docker 4 OSX)

## Build Environment

```
docker-compose build
```

## Bring Environment UP

```
docker-compose up
```

## Go to web interface

Percona QAN will be listening on `http://192.168.99.100:8000`


