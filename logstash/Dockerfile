ARG LOGSTASH_VERSION
FROM docker.elastic.co/logstash/logstash-oss:${LOGSTASH_VERSION}
USER root
RUN rm -rf /usr/share/logstash/pipeline/
RUN rm -rf /usr/share/logstash/sincedbs/
COPY --chown=logstash:logstash pipeline/ /usr/share/logstash/pipeline/
COPY --chown=logstash:logstash sincedbs/ /usr/share/logstash/sincedbs/
COPY --chown=logstash:logstash ssl/root-ca.pem /usr/share/logstash/config/
COPY --chown=logstash:logstash config/logstash.yml /usr/share/logstash/config/

USER logstash