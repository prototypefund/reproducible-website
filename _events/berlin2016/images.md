---
layout: new/event_detail
title: Reproducible images
event: berlin2016
order: 110
permalink: /events/berlin2016/images/
---

### agreed points:
 * docker image, vagrant box, etc. are all just "packages"

 * which container/VM does not matter for reproducibility
 * it does matter for ease of use/setup

 * perfect buildinfo is the goal
 * intermediate steps can be useful



### notes:

 * bazel, build only from directly available sources, no net, into docker
 * fdroid, vagrant to build up on VirtualBox
 * mozilla/nix, build up images per task, never use a base image

 * docker, AWS image, VirtualBox

 * basel builds up debian/ubuntu docker images
 * all source code, local and upstream, are checked into local source repo
 * 5 base images, security and legal reviewed

 * nix could do base images, but don't see the need yet.
 * could be used for caching to speed things up

 * with certain compilers (e.g. javac), wide variations can produce the same thing
 * can't be a buildinfo dependency, too hard to deal with problems

 * tools for specifying buildinfo
 * blaze forces central build infrastructure, so forces standard build envs
 * nix is a build tool first, and incidentally a package manager

 * Debian images can be reproducible using snapshots, specify date to snapshots in /etc/apt/sources.list

 * it is possible to not require full buildinfo in advance, if there is a reproducible base image that builds against user input, and it reproduces any given user submitted build, then that can also generate the buildinfo

### what are the benefits of bit-perfect reproducible

 * more effective caching
 * security audits, easy to track binaries to find original source
 * catching bugs by finding unexpected changes

-
