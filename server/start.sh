#!/usr/bin/env bash

HOST_IP=$PMM_PORT_9001_TCP_ADDR

if [ -z "$HOST_IP" -a -z "$MYSQL_ROOT_PASSWORD" ]; then
	echo >&2 'error: percona agent HOST_IP is not specified'
	echo >&2 '  You need to specify HOST_IP and $MYSQL_ROOT_PASSWORD'
	exit 1
fi

set -eu

/entrypoint.sh mysqld --userstat=1 & 





export HOSTNAME="${HOSTNAME:-"$(hostname -f)"}"

cd ~
PKG="ppl-agent"
[ -d $PKG ] && rm -rf $PKG
mkdir $PKG
curl -LO https://www.percona.com/downloads/TESTING/ppl/open-source/${PKG}.tar.gz
tar xvfz ${PKG}.tar.gz -C $PKG
cd $PKG/*

# here we wait until mysql becomes reachable, then we can install the agent
while ! nc 127.0.0.1 3306 </dev/null; do sleep 1; done

# then we wait until the API becomes online
while ! nc $HOST_IP 9001 </dev/null; do sleep 1; done

./install -socket=/var/lib/mysql/mysql.sock -password=$MYSQL_ROOT_PASSWORD -user=root $HOST_IP


tail -f /usr/local/percona/agent/percona-agent.log

