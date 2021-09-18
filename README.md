# Zonemaster Docker image

This repository is used to produce a custom [Zonemaster CLI][1] Docker
image. That being the CLI version of <https://zonemaster.net/>.

We have [AFNIC][2] and [The Swedish Internet Foundation][3] to thank
for the Zonemaster project.


## Usage

```shell
docker run --rm --user=4848 --cap-drop=all --security-opt=no-new-privileges --read-only --tty ghcr.io/andreaso/zonemaster-cli:2021.1.2 --help
```

```shell
docker run --rm --user=4848 --cap-drop=all --security-opt=no-new-privileges --read-only --network=host --tty ghcr.io/andreaso/zonemaster-cli:2021.1.2 DOMAIN
```

(Suggesting `--network=host` since it's more likely to have IPv6 connectivity by default.)


## Custom profile

This Docker image uses a custom Zonemaster profile which differs from
the default in that the [nameserver03][5] AXFR test is skipped. Partly
because arbitrary AXFR queries can potentially be seen as noisy or
impolite. Partly because it's not a configuration issue I'm overly
concerned about once you get past your initial setup.

There is also a crude attempt being made to autodetect whatever the
container running this image is capable of doing IPv6 queries or not.


## Versioning

The Docker image is tagged according to corresponding [Zonemaster release][4].


[1]: https://github.com/zonemaster/zonemaster-cli
[2]: https://www.afnic.fr/
[3]: https://internetstiftelsen.se/
[4]: https://github.com/zonemaster/zonemaster/releases
[5]: https://github.com/zonemaster/zonemaster/blob/master/docs/specifications/tests/Nameserver-TP/nameserver03.md
