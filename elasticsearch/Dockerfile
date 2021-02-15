ARG ES_VERSION
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:${ES_VERSION}
ENV REGION us-west-2
USER root
COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch ssl/esnode-key.pem /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch ssl/esnode.pem /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch ssl/kirk-key.pem /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch ssl/kirk.pem /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch ssl/root-ca.pem /usr/share/elasticsearch/config/
USER elasticsearch
WORKDIR /usr/share/elasticsearch
RUN bin/elasticsearch-plugin install -b discovery-ec2 && bin/elasticsearch-plugin install -b repository-s3 && sed -e '/^-Xm/s/^/#/g' -i /usr/share/elasticsearch/config/jvm.options
RUN bin/elasticsearch-plugin install -b https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-security/opendistro_security-1.12.0.0.zip
RUN bin/elasticsearch-plugin install -b https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-sql/opendistro_sql-1.12.0.0.zip
RUN echo "********" | bin/elasticsearch-keystore create -v
RUN echo "********" | bin/elasticsearch-keystore add s3.client.default.access_key
RUN echo "********" | bin/elasticsearch-keystore add s3.client.default.secret_key. 
USER root
COPY --chown=elasticsearch:elasticsearch opendistro/internal_users.yml /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/
USER elasticsearch