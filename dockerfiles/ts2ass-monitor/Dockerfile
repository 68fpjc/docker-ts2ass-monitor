FROM python:2.7-slim-buster
RUN : \
   && set -x \
   && apt-get update \
   \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends locales \
   && sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen \
   && locale-gen \
   \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates curl \
   && mkdir -p /app/arib/ \
   && cd /app/arib/ \
   && curl -L https://github.com/johnoneil/arib/tarball/master \
   | tar -zx --strip-components=1 \
   && pip2 install -e . \
   \
   && mkdir -p /app/monitor/ \
   && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends inotify-tools \
   \
   # cleanup
   && cd / \
   && apt-get remove -y ca-certificates curl \
   && apt-get autoremove -y \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/* \
   && rm -rf /tmp/* \
   && :
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD []
ENV LANG=ja_JP.UTF-8
