# Zonemaster Docker image

This repository is used to produce a custom [Zonemaster CLI][1] Docker
image. That being the CLI version of https://zonemaster.net/.

We have [AFNIC][2] and [The Swedish Internet Foundation][3] to thank
for the Zonemaster project.


## Usage

```
docker run --rm --tty docker.pkg.github.com/andreaso/zonemaster-image/zonemaster-cli --help
```

```
docker run --rm --tty docker.pkg.github.com/andreaso/zonemaster-image/zonemaster-cli DOMAIN
```


## Custom profile

This Docker image uses a custom Zonemaster profile which differs from
the default in two ways.

1. IPv6 queries have been disabled. This is due to that most Docker
   container environment don't have IPv6 configured.

2. The _nameserver03_ AXFR test is skipped. Partly because arbitrary
   AXFR queries can be seen as noisy or impolite. Partly because it's
   not a configuration issue I'm overly concerned about once you get
   past your initial setup.


[1]: https://github.com/zonemaster/zonemaster-cli
[2]: https://www.afnic.fr/
[3]: https://internetstiftelsen.se/
