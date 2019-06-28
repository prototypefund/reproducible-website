---
layout: event_detail
title: Controlling the build environment
event: athens2015
order: 20
permalink: /events/athens2015/controlled-build-environment/
---

*45-minute + 10 minute session on day 1*

Testing that a piece of software is reproducible means having the ability
to control the environment to perform variations that could later be found
in the wild. A project could also decide to making a piece of software
reproducible by specifying precisely in which environment it should be build.
Both approaches basically require the same set of tools, it's just when that
differs.


Non-exhaustive list of variations: username, hostname, build path, timezone,
cpu, locale, filesystem ordering

Every project can approach differently:

 - some projects want to set the same build environment for every developers
 - other projects want different environments to produce same builds. In that case, need to test using different environments.

For Debian:

 - sbuild/pbuilder: unpack a minimal chroot, install dependencies, and build
 - script called prebuild, doing build twice with different environments to find sources of non-determinism
 - srebuild script using the list of packages involved in the build initially recorded in `.buildinfo files`. We can use snapshot.debian.org to recreate environment.
 - on debian, different system has been setup 399 days in the future to check reproducibility
 - some packages have valid-before, valid-after X.509 certificates
 - no network access in the builds
 - issue: libraries compiling optimisations depending on cpu. libgmp: `--enable-fat` option can disable this. Deciding which optimization to use on user side instead of build side.

On FreeBSD:

 - [poudriere](https://github.com/freebsd/poudriere)
 - tool to setup environment using [jails](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/jails.html)
 - very easy for users
 - can set hostname, timezone, user inside the jail, build path, network, fake kernel version
 - only thing not possible to change from jail: faking the time
 - lot of people use that to build because it's easy

For single projects:

 - can be easier to use VM
 - VM: need a lot of trust in the VM, we can't yet reproducibly build images
 - can use containers on Linux

Qubes:

 - does not capture yet the environment
 - build with same user and path

Google:

 - build farm on Google internal network
 - isolation not to enforce things, but avoid accidents
 - bazel, sandbox
 - with bazel, caching when building on the same machine
 - not yet at reproducible cross-host and cross-user

OS X:

 - no jail, standard chroot
 - problem: some standard apple tools broken in chroot
 - no easy way to change hostname and username
 - best approach at the moment, using VM
 - macports: `LD_PRELOAD` to hide some files: 100% overhead
 - Tor Browser: cross compiling from Linux using Apple SDK
 - Homebrew: user relocatable installation, don't produce binary identical
   binaries because of paths. sometimes grepping won't work

Faking CPU can be tricky. One solution is to tell kvm to stop exposing the host CPU.

disorderfs, implemented with FUSE, allow to test for issues tied to filesystem ordering. By default it will return results of readdir(3) backward. It could be modified to always returned readdir(3) in a sorted order to implement a normalized environment.

Archive creation tools:

 - GNU Tar has an option to do reproducible tarballs
 - bsdtar not yet
 - At Google, fixed: tar, zip, ar, rpm. Not yet upstreamed changes.
 - lzma is threaded: result depends on number of cpu

Things we could do:

 - Fixing libarchive, and archive tools: sort files list, normalize permissions
 - Improve freebsd jails: number of cpu, amount of memory
 - Missing: tool to run the same thing twice in different environments
 - Improve Linux containers: fake cpu
