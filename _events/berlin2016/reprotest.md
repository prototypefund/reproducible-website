---
layout: event_detail
title: reprotest
event: berlin2016
order: 40
permalink: /events/berlin/2016/reprotest/
---

Platforms in the group: Debian, FreeBSD, Window River (RPM), Ubuntu/Mint

reporotest was a project that Lunar proposed, and was started as a GSoC project
in Summer 2017.  It builds a package in different kinds of environment to check
if it's reproducible.

It can build a package twice with different build environment and then compare
it with diffoscope.

It's written in python, made cross-platform, without many dependencies.

Some of the variations reprotests does are Linux specific for now, this needs to
be expanded to other platforms.

Variations are fixed, but an improvement would be to make them random.

Need better logic to select the variations between the two builds.

Ximin explains what diffoscope is, and shows us a demo.

Ximin shows us the code of reprotest.  It's quite straight-forward.

reprotest can work using different virtual enviroments (ssh, qemu, lxc).

automatic detection to build packages is only supported for Debian.  More distro
build systems need to be included.

Projects outside Debian have set up their own tools to check reproducibility.
The idea of reprotests is to have a general tool for everyone.

It would be useful to make a list of all the variations that any tool could make
to check reproducibility, and then when a package is not reproducible, bisect
the variations to figure out which one makes the build different.

Follow up: the idea is to build a package twice repeating the same environment
as close as possible, and then start adding variations to figure out which one
causes a difference in the build.

Suggestion: Do one build in one virtual environment, and the other in a
different virtual environment.

TODO: make it work for RPM, make it work for FreeBSD (with FreeBSD specific
variations).


