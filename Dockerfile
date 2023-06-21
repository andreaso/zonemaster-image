FROM ubuntu:23.04
LABEL org.opencontainers.image.source="https://github.com/andreaso/zonemaster-image"
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
  cpanminus \
  libc6-dev \
  libclass-accessor-perl \
  libclone-perl \
  libdevel-checklib-perl \
  libemail-valid-perl \
  libfile-sharedir-perl \
  libfile-slurp-perl \
  libidn2-dev \
  libintl-perl \
  libio-socket-inet6-perl \
  libjson-xs-perl \
  liblist-moreutils-perl \
  liblocale-po-perl \
  liblog-any-perl \
  libmailtools-perl \
  libmodule-find-perl \
  libmodule-install-xsutil-perl \
  libmoosex-getopt-perl \
  libmoosex-singleton-perl \
  libnet-ip-xs-perl \
  libpod-coverage-perl \
  libreadonly-perl \
  libssl-dev \
  libtest-differences-perl \
  libtest-exception-perl \
  libtest-fatal-perl \
  libtest-nowarnings-perl \
  libtest-pod-perl \
  libtext-csv-perl \
  libtext-reflow-perl \
  libtry-tiny-perl \
  libyaml-libyaml-perl \
  make \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm https://cpan.metacpan.org/authors/id/Z/ZN/ZNMSTR/Zonemaster-LDNS-3.2.0.tar.gz \
    && cpanm https://cpan.metacpan.org/authors/id/Z/ZN/ZNMSTR/Zonemaster-Engine-v4.7.0.tar.gz \
    && cpanm https://cpan.metacpan.org/authors/id/Z/ZN/ZNMSTR/Zonemaster-CLI-v6.0.0.tar.gz \
    && rm -rf /root/.cpanm/
COPY entry /entry
COPY profile.json.in /etc/zonemaster-profile.json.in
RUN useradd --create-home --comment "Zone Master" --shell /bin/dash --user-group --uid 4848 zonemaster
USER zonemaster
ENTRYPOINT ["/entry"]
CMD ["--help"]
