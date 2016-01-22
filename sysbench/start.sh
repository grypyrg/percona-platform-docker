#!/bin/bash -e

# here we wait until mysql becomes reachable, then we can start sysbench
while ! nc $MYSQL_HOST $MYSQL_PORT </dev/null; do sleep 1; done



mysql -u root -psecret -e "create database sbtest"

sysbench \
	--test=/usr/share/doc/sysbench/tests/db/parallel_prepare.lua \
	--db-driver=mysql \
	--mysql-user=root \
	--mysql-password=secret \
	--mysql-db=sbtest  \
	--mysql-table-engine=innodb \
	--mysql-host=$MYSQL_HOST \
	--mysql-port=$MYSQL_PORT \
	--oltp-tables-count=32 \
	--oltp-table-size=10000 \
	--oltp-auto-inc=off \
	--num-threads=4  \
	run



sysbench \
	--db-driver=mysql \
        --test=/usr/share/doc/sysbench/tests/db/oltp.lua \
	--mysql-table-engine=innodb \
	--mysql-user=root \
	--mysql-password=secret \
	--mysql-db=sbtest \
	--mysql-host=$MYSQL_HOST \
	--mysql-port=$MYSQL_PORT \
	--oltp-tables-count=32 \
        --oltp-table-size=10000 \
	--report-interval=1 \
	--num-threads=4 \
	--max-requests=0 \
	--max-time=0 \
	--tx-rate=20 \
	run | grep -v "queue length"
