FROM percona/percona-server:latest

RUN yum install -y nc

COPY start.sh .

CMD ["./start.sh"]
#ENTRYPOINT ["/bin/sh"]

