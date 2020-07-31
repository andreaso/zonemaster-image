FROM ubuntu:20.04
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
  autoconf automake build-essential cpanminus libclone-perl \
  libdevel-checklib-perl libfile-sharedir-perl libfile-slurp-perl \
  libidn11-dev libintl-perl libio-socket-inet6-perl libjson-pp-perl \
  liblist-moreutils-perl liblocale-msgfmt-perl libmoosex-getopt-perl \
  libmail-rfc822-address-perl libmodule-find-perl libtext-reflow-perl \
  libmodule-install-perl libmodule-install-xsutil-perl libmoose-perl \
  libnet-ip-perl libpod-coverage-perl libreadonly-xs-perl \
  libtest-simple-perl libssl-dev libtest-differences-perl \
  libtest-exception-perl libtest-fatal-perl libtest-pod-perl \
  libtext-csv-perl libwww-perl libtool m4 \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm --from https://www.cpan.org Zonemaster::LDNS Zonemaster::Engine Zonemaster::CLI \
  && rm -rf /root/.cpanm/
COPY profile.json /etc/zonemaster-profile.json
RUN adduser --disabled-password --gecos "Zone Master" --uid 4848 zonemaster
USER zonemaster
ENTRYPOINT ["/usr/local/bin/zonemaster-cli", "--profile", "/etc/zonemaster-profile.json"]
CMD ["--help"]
