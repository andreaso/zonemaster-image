FROM ubuntu:20.10
LABEL org.opencontainers.image.source="https://github.com/andreaso/zonemaster-image"
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
  cpanminus \
  libc6-dev \
  libclone-perl \
  libdevel-checklib-perl \
  libemail-valid-perl \
  libfile-sharedir-perl \
  libfile-slurp-perl \
  libidn11-dev \
  libintl-perl \
  libio-socket-inet6-perl \
  libjson-xs-perl \
  liblist-moreutils-perl \
  liblocale-msgfmt-perl \
  libmailtools-perl \
  libmodule-find-perl \
  libmodule-install-xsutil-perl \
  libmoosex-getopt-perl \
  libmoosex-singleton-perl \
  libnet-interface-perl \
  libpod-coverage-perl \
  libreadonly-xs-perl \
  libssl-dev \
  libtest-differences-perl \
  libtest-exception-perl \
  libtest-fatal-perl \
  libtest-pod-perl \
  libtext-csv-perl \
  libtext-reflow-perl \
  make \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm https://cpan.metacpan.org/authors/id/Z/ZN/ZNMSTR/Zonemaster-LDNS-2.1.0.tar.gz \
    && cpanm https://cpan.metacpan.org/authors/id/Z/ZN/ZNMSTR/Zonemaster-Engine-v4.1.1.tar.gz \
    && cpanm https://cpan.metacpan.org/authors/id/Z/ZN/ZNMSTR/Zonemaster-CLI-v3.0.4.tar.gz \
    && rm -rf /root/.cpanm/
COPY entry /entry
COPY profile.json.in /etc/zonemaster-profile.json.in
RUN adduser --disabled-password --gecos "Zone Master" --uid 4848 zonemaster
USER zonemaster
ENTRYPOINT ["/entry"]
CMD ["--help"]
