#!/usr/bin/env bash

API_HOSTNAME=$PLATFORM_PORT_9001_TCP_ADDR

if [ -z "$API_HOSTNAME" -a -z "$MYSQL_ROOT_PASSWORD" ]; then
	echo >&2 'error: percona agent API_HOSTNAME is not specified'
	echo >&2 '  You need to specify API_HOSTNAME and $MYSQL_ROOT_PASSWORD'
	exit 1
fi

set -eu

/entrypoint.sh mysqld & 





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
while ! nc $API_HOSTNAME 9001 </dev/null; do sleep 1; done

./install -mysql-socket=/var/lib/mysql/mysql.sock -mysql-pass=$MYSQL_ROOT_PASSWORD -mysql-user=root $API_HOSTNAME


tail -f /usr/local/percona/agent/percona-agent.log

