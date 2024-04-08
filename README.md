# getidev

[![Build Status](https://drone.cryptic.systems/api/badges/volker.raschek/getidev/status.svg)](https://drone.cryptic.systems/volker.raschek/getidev)
[![Docker Pulls](https://img.shields.io/docker/pulls/volkerraschek/getidev)](https://hub.docker.com/r/volkerraschek/getidev)

`getidev` is a small program to determine the network interface name based on a
provided ip address.

`getidev` serves as an alternative to `ip route get <ip> | awk ...` because `ip
route get` can return a different output depending on of the distribution and
the installed package versions. For this reason was `getidev` developed to
return a stable outout.

`getidev` is also as container image available: `docker.io/volkerraschek/getidev`.
