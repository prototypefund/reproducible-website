---
title: Volatile inputs can disappear
layout: docs
permalink: /docs/volatile-inputs/
---

Inputs from the network—even if it doesn’t seem like
it—are volatile. It's best to make a build system not rely
on remote data.

If it must be the case, then:

 1. ensure integrity using cryptographic checksums,
 2. keep backups.

Ideally, a fallback location should be available with the backups.

A good example is how the [FreeBSD](https://www.freebsd.org/) ports
work. Port descriptions
contain a list of
[`MASTER_SITES`](https://www.freebsd.org/doc/en/books/porters-handbook/makefile-distfiles.html#makefile-master_sites),
a list of files to be retrieved in `DISTFILES`, and a `distinfo` file
with cryptographic checksums for each of these files. The FreeBSD
infrastructure ensure that a copy of all *distfiles* are kept available
on a mirror network. When building a port, the files will be downloaded
from there if the original *master site* is unreachable.
