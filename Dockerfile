FROM alpine:3.7

RUN apk add --no-cache mongodb-tools py2-pip && \
  pip install awscli && \
  mkdir /backup

ENV S3_PATH=mongodb AWS_DEFAULT_REGION=eu-central-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup

VOLUME /backup

CMD /usr/local/bin/entrypoint
