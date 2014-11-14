FROM debian:jessie
ENV TAR_VERSION 1.28
ENV FORCE_UNSAFE_CONFIGURE 1
RUN apt-get update && apt-get install -y build-essential --no-install-recommends curl \
  && mkdir -p /opt/tar \
  && curl http://ftp.gnu.org/gnu/tar/tar-$TAR_VERSION.tar.gz \
  | tar -zxC /opt/tar --strip-components=1 \
  && cd /opt/tar \
  && ./configure LDFLAGS="-static" \
  && make \
  && make install \
  && tar -cf /tar.tar /usr/local/bin/tar
CMD cat /tar.tar
