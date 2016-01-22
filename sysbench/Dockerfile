FROM centos:centos7
MAINTAINER Kenny Gryp <kenny@goss.be>

RUN rpmkeys --import https://www.percona.com/downloads/RPM-GPG-KEY-percona
RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
RUN yum install -y Percona-Server-client-56
RUN sed -i 's/tsflags=nodocs//g' /etc/yum.conf
RUN yum install -y sysbench
RUN yum install -y nc


COPY start.sh /start.sh

CMD ["/start.sh"]
