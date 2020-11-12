FROM ubuntu:20.04
LABEL org.opencontainers.image.source https://github.com/andreaso/zonemaster-image
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
  cpanminus make libc6-dev libidn11-dev libssl-dev \
  libclone-perl libdevel-checklib-perl libemail-valid-perl \
  libfile-sharedir-perl libfile-slurp-perl libintl-perl \
  libio-socket-inet6-perl libjson-xs-perl liblist-moreutils-perl \
  liblocale-msgfmt-perl libmailtools-perl libmodule-find-perl \
  libmodule-install-xsutil-perl libmoosex-getopt-perl libmoosex-singleton-perl \
  libpod-coverage-perl libreadonly-xs-perl libtest-differences-perl \
  libtest-exception-perl libtest-fatal-perl libtest-pod-perl \
  libtext-csv-perl libtext-reflow-perl \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm --from https://www.cpan.org Zonemaster::LDNS Zonemaster::Engine Zonemaster::CLI \
  && rm -rf /root/.cpanm/
COPY entry /entry
COPY profile.json.in /etc/zonemaster-profile.json.in
RUN adduser --disabled-password --gecos "Zone Master" --uid 4848 zonemaster
USER zonemaster
ENTRYPOINT ["/entry"]
CMD ["--help"]
