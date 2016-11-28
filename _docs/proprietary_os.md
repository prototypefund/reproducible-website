---
title: Proprietary operating systems
layout: docs
permalink: /docs/proprietary-os/
---


On proprietary operating systems, it is hard to determine if they are tampered
with. Typically, they also require non-free compilation tools that can be hard
to obtain for users.

The good news is that for some cases, we have free software tools which
are able to cross-compile software for proprietary operating systems
on free operating systems. Both Bitcoin and Tor Browser have pioneered
the technique to build their Windows and Mac OS X versions.

Windows
-------

For Windows, [mingw-w64](https://mingw-w64.org/) will build Windows
binaries on POSIX compatible operating systems.

[NSIS](http://nsis.sourceforge.net/) can be used to create integrated
installation package.

Both are readily available in several free software distributions.

Mac OS X
--------

crosstool-ng [should work](https://bugs.torproject.org/9711#comment:73) to
build software for Mac OS X. Sadly this seems to require a non-redistributable
part of the Apple SDK. It can be extracted from XCode which can be downloaded
at no charge.

Software from Mac OS X is often distributed as disk images (`.dmg`)
which can be created under GNU/Linux, but it seems to [require multiple
tools at the
moment](https://gitweb.torproject.org/builders/tor-browser-bundle.git/tree/gitian/build-helpers/ddmg.sh).
