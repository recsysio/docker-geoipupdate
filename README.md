MaxMind GeoIP Update
--------------------

This is a Docker image that would run MaxMind geoipupdate command to update a geoip database on your host system.

[![Build Status][build-badge]][build-link]
[![License][license-badge]](LICENSE)
[![Docker Pulls][docker-badge]][docker-link]

Usage
-----

### Pull an image

```
docker pull recsysio/geoipupdate
```

### Run the image

```
docker run --rm -v $(pwd):/data/db -e ACCOUNT_ID=12345 -e LICENSE_KEY=WA0WxDa007lWWXIzXV recsysio/geoipupdate
```

Configuration
-------------

Environment variables:

- `ACCOUNT_ID` - MaxMind account ID.
- `LICENSE_KEY` - License key associated with MaxMind account.
- `EDITION_IDS` - The edition IDs of the databases to update (separated by spaces).

License
-------

Released under the [MIT license](LICENSE).


[build-link]:     https://github.com/recsysio/docker-geoipupdate/actions?workflow=build
[build-badge]:    https://github.com/recsysio/docker-geoipupdate/workflows/build/badge.svg
[license-badge]:  https://img.shields.io/badge/license-MIT-brightgreen.svg
[docker-link]:    https://hub.docker.com/r/recsysio/geoipupdate
[docker-badge]:   https://img.shields.io/docker/pulls/recsysio/geoipupdate
