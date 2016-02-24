FROM percona/pmm:latest

COPY prometheus.yml /opt/prometheus/
COPY supervisord.conf /etc/supervisor/conf.d/pmm.conf

CMD ["supervisord"]
