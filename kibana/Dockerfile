ARG KIBANA_VERSION
FROM docker.elastic.co/kibana/kibana-oss:${KIBANA_VERSION}
ENV REGION us-west-2
USER root
COPY --chown=kibana:kibana kibana.yml /usr/share/kibana/config/
COPY --chown=kibana:kibana ssl/esnode-key.pem /usr/share/kibana/config/
COPY --chown=kibana:kibana ssl/esnode.pem /usr/share/kibana/config/
COPY --chown=kibana:kibana ssl/root-ca.pem /usr/share/kibana/config/
USER kibana
WORKDIR /usr/share/kibana
RUN bin/kibana-plugin install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-security/opendistroSecurityKibana-1.12.0.0.zip