# Chrony NTP Docker Image
FROM alpine:latest
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"

# hadolint ignore=DL3002
USER root

# Install The Chrony Package
# hadolint ignore=DL3018
RUN apk --update --no-cache add chrony tini && \
  rm -rf /var/cache/apk/* /etc/chrony && \
  touch /var/lib/chrony/chrony.drift && \
  chown chrony:chrony -R /var/lib/chrony

# Copy The Start Script
COPY files/start.sh /usr/local/bin/start.sh
RUN chmod 0755 /usr/local/bin/start.sh


# Set The Work Directory And Command Points
WORKDIR /tmp
EXPOSE 123/udp
EXPOSE 323/udp
ENTRYPOINT ["tini", "--"]
CMD ["/usr/local/bin/start.sh"]

# Check Process Within The Container Is Healthy
HEALTHCHECK --interval=60s --timeout=5s CMD chronyc tracking > /dev/null
